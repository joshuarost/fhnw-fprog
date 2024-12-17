module He.Html where

import           Data.List (intersperse)

{-# ANN module "HLint: ignore Eta reduce" #-}
type Html = String

nbsp :: Html
nbsp = "&nbsp;"

e :: String -> Html -> Html
e tag kids = ea tag [] kids

ea :: String -> [(String, String)] -> Html -> Html
ea tag attrs kids = concat [ea_ tag attrs, kids, "</" ++ tag ++ ">"]

-- Use this function for self-closing tags like <img> or <br>
ea_ :: String -> [(String, String)] -> Html
ea_ tag attrs = "<" ++ tag ++ attrsHtml attrs ++ ">"

attrsHtml :: [(String, String)] -> String
attrsHtml [] = []
attrsHtml as = concat $ " ":intersperse " " (map attrHtml as)
  where
    attrHtml (key, value) = key ++ "='" ++ value ++ "'"

link :: String -> String -> Html
link text url = ea "a" [("href", url)] text

submit :: String -> Html
submit text = ea "button" [("type", "submit")] text