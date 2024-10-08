-----------------------------------------------------------------------
--
-- 	Haskell: The Craft of Functional Programming, 3e
-- 	Simon Thompson
-- 	(c) Addison-Wesley, 1996-2011.
--
-- 	PicturesSVG
--
--      The Pictures functionality implemented by translation
--      SVG (Scalable Vector Graphics)
--
--      These Pictures could be rendered by conversion to ASCII art,
--      but instead are rendered into SVG, which can then be viewed in
--      a browser: google chrome does a good job.
--
-----------------------------------------------------------------------

module PicturesSVG where

import System.IO

-- Pictures represened by a type of trees, so this is a deep
-- embedding.

data Picture
  = Img Image
  | Above Picture Picture
  | Beside Picture Picture
  | FlipH Picture
  | FlipV Picture
  | Negative Picture
  deriving (Show)

-- Coordinates are pairs (x,y) of integers
--
--  o------> x axis
--  |
--  |
--  V
--  y axis

type Point = (Int, Int)

-- The Point in an Image gives the dimensions of the image in pixels.

data Image = Image Name Point
  deriving (Show)

data Name = Name String
  deriving (Show)

--
-- The functions over Pictures
--

above, beside :: Picture -> Picture -> Picture
above = Above
beside = Beside

-- flipH is flip in a horizontal axis
-- flipV is flip in a vertical axis
-- negative negates each pixel

-- The definitions of flipH, flipV, negative push the
-- constructors through the binary operations to the images
-- at the leaves.

-- Original implementation incorrect: it pushed the
-- flipH and flipV through all constructors ...
-- Now it distributes appropriately over Above, Beside and Over.

flipH, flipV, invert :: Picture -> Picture
flipH (Above pic1 pic2) = (flipH pic2) `Above` (flipH pic1)
flipH (Beside pic1 pic2) = (flipH pic1) `Beside` (flipH pic2)
flipH pic = FlipH pic
flipV (Above pic1 pic2) = (flipV pic1) `Above` (flipV pic2)
flipV (Beside pic1 pic2) = (flipV pic2) `Beside` (flipV pic1)
flipV pic = FlipV pic
invert = Negative

-- Library functions

-- Dimensions of pictures
width, height :: Picture -> Int
width (Img (Image _ (x, _))) = x
width (Above pic1 pic2) = max (width pic1) (width pic2)
width (Beside pic1 pic2) = (width pic1) + (width pic2)
width (FlipH pic) = width pic
width (FlipV pic) = width pic
width (Negative pic) = width pic
height (Img (Image _ (x, y))) = y
height (Above pic1 pic2) = (height pic1) + (height pic2)
height (Beside pic1 pic2) = max (height pic1) (height pic2)
height (FlipH pic) = height pic
height (FlipV pic) = height pic
height (Negative pic) = height pic

-- Converting pictures to a list of basic images.

-- A Filter represents which of the actions of flipH, flipV
-- and negative is to be applied to an image in forming a
-- Basic picture.

data Filter = Filter {fH, fV, neg :: Bool}
  deriving (Show)

newFilter :: Filter
newFilter = Filter False False False

data Basic = Basic Image Point Filter
  deriving (Show)

-- Flatten a picture into a list of Basic pictures.
-- The Point argument gives the origin for the coversion of the
-- argument.

flatten :: Point -> Picture -> [Basic]
flatten (x, y) (Img image) = [Basic image (x, y) newFilter]
flatten (x, y) (Above pic1 pic2) = flatten (x, y) pic1 ++ flatten (x, y + height pic1) pic2
flatten (x, y) (Beside pic1 pic2) = flatten (x, y) pic1 ++ flatten (x + width pic1, y) pic2
flatten (x, y) (FlipH pic) = map flipFH $ flatten (x, y) pic
flatten (x, y) (FlipV pic) = map flipFV $ flatten (x, y) pic
flatten (x, y) (Negative pic) = map flipNeg $ flatten (x, y) pic

-- flip one of the flags for transforms / filter

flipFH (Basic img (x, y) f@(Filter {fH = boo})) = Basic img (x, y) f {fH = not boo}

flipFV (Basic img (x, y) f@(Filter {fV = boo})) = Basic img (x, y) f {fV = not boo}

flipNeg (Basic img (x, y) f@(Filter {neg = boo})) = Basic img (x, y) f {neg = not boo}

-- Convert a Basic picture to an SVG image, represented by a String.
convert :: Basic -> String
convert (Basic (Image (Name name) (width, height)) (x, y) (Filter fH fV neg)) =
  "\n  <image x=\""
    ++ show x
    ++ "\" y=\""
    ++ show y
    ++ "\" width=\""
    ++ show width
    ++ "\" height=\""
    ++ show height
    ++ "\" xlink:href=\""
    ++ name
    ++ "\""
    ++ flipPart
    ++ negPart
    ++ "/>\n"
  where
    flipPart =
      if fH && not fV
        then " transform=\"translate(0," ++ show (2 * y + height) ++ ") scale(1,-1)\" "
        else
          if fV && not fH
            then " transform=\"translate(" ++ show (2 * x + width) ++ ",0) scale(-1,1)\" "
            else
              if fV && fH
                then " transform=\"translate(" ++ show (2 * x + width) ++ "," ++ show (2 * y + height) ++ ") scale(-1,-1)\" "
                else ""
    negPart =
      if neg
        then " filter=\"url(#negative)\""
        else ""

-- Outputting a picture.
-- The effect of this is to write the SVG code into a file
-- whose path is hardwired into the code. Could easily modify so
-- that it is an argument of the call, and indeed could also call
-- the browser to update on output.
render :: Picture -> IO ()
render pic =
  let picList = flatten (0, 0) pic
      svgString = concat (map convert picList)
      newFile = preamble ++ svgString ++ postamble
   in do
        outh <- openFile "result.svg" WriteMode
        hPutStrLn outh newFile
        hClose outh

-- Preamble and postamble: boilerplate XML code.

preamble =
  "<svg width=\"100%\" height=\"100%\" version=\"1.1\"\n"
    ++ "xmlns=\"http://www.w3.org/2000/svg\" xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n"
    ++ "<filter id=\"negative\">\n"
    ++ "<feColorMatrix type=\"matrix\"\n"
    ++ "values=\"-1 0  0  0  0  0 -1  0  0  0  0  0 -1  0  0  1  1  1  0  0\" />\n"
    ++ "</filter>\n"

postamble =
  "\n</svg>\n"

-- Example picture
lambda :: Picture
lambda = Img $ Image (Name "lambda.png") (100, 100)

rotate180 :: Picture -> Picture
rotate180 p = flipH (flipV p)

aufgabeA = render (beside (beside lambda lambda) lambda)

aufgabeB = render (above (beside lambda (invert lambda)) (beside (invert lambda) lambda))

aufgabeC = render (invert (flipH (flipV lambda)))

aufgabe2 = render (rotate180 lambda)
