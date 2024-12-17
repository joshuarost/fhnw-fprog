-- | Dieses Modul enthält Funktionen um HTML zu generieren.
module Prereq where

import Data.List (intersperse)

-- | Type Alias für Html Strings
type Html = String

-- | Erzeugt ein Element ohne Attribute
e :: String -> Html -> Html
e tag kids = ea tag [] kids

-- | Erzeugt ein Element mit Attributen
ea :: String -> [(String, String)] -> Html -> Html
ea tag attrs kids = concat $ ["<", tag] ++ attrsHtml attrs ++ [">", kids, "</", tag, ">"]
  where
    attrsHtml [] = []
    attrsHtml as = " " : intersperse " " (map attrHtml as)
    attrHtml (key, value) = key ++ "='" ++ value ++ "'"

-- | Erzeugt ein HTML Dokument mit dem gegebenen String als h1 Text.
createPage :: String -> Html
createPage title =
  unlines
    [ "<!DOCTYPE html>",
      ea "html" [("lang", "en")] $ unlines [
        header, 
        body title
      ]
    ]

header :: Html
header =
  e "head" $
    unlines
      [ "<meta charset='utf-8'>",
        "<link rel='stylesheet' href='/styles.css'>"
      ]

body :: String -> Html
body title =
  e "body" $
    e "h1" title



{-
  unlines [
  "<!DOCTYPE html>",
  "<html lang='en'>",
  "  <head>",
  "    <link rel='stylesheet' href='/styles.css'></link>"
  "  </head>",
  "  <body>",
  "    <h1>" ++ title ++ "</h1>",
  "  </body>",
  "</html>"]
-}
