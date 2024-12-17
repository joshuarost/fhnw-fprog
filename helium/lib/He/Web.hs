{-# LANGUAGE OverloadedStrings #-}

module He.Web where

import           Control.Monad.IO.Class (liftIO)
import qualified Data.Text.Lazy as LT
import           Network.Wai.Middleware.RequestLogger (logStdoutDev)
import           Web.Scotty (ActionM, file, formParam, get, html, pathParam
                           , post, redirect, scotty, setHeader)
import           Web.Scotty.Trans (middleware)
import           He.Html (Html, e, ea, ea_, submit, link)
import           He.File (save, getIdeas, readIdea, removeIdea)
import           He.Template (template)
import           Data.List (isInfixOf)

main :: IO ()
main = scotty 3000
  $ do
    middleware logStdoutDev
    get "/styles.css" styles
    get "/" (homeAction "" "")
    get "/he/:idea"
      $ do
        idea <- pathParam "idea"
        content <- liftIO (readIdea idea)
        homeAction idea content
    post "/he/save"
      $ do
        idea <- formParam "idea"
        content <- formParam "content"
        liftIO (save idea content)
        redirect "/"
    post "/he/:idea/delete/"
      $ do
        idea <- pathParam "idea"
        liftIO (removeIdea idea)
        redirect "/"

styles :: ActionM ()
styles = do
  setHeader "Content-Type" "text/css"
  file "static/styles.css"

htmlString :: String -> ActionM ()
htmlString = html . LT.pack

homeAction :: String -> String -> ActionM ()
homeAction idea content = do
  ideas <- liftIO getIdeas
  contents <- liftIO $ mapM readIdea ideas
  htmlString
    $ template
    $ unlines
      [ title
      , form idea content
      , e "h2" "Graph"
      , graph ideas contents
      , e "h2" "Collection"
      , collection ideas]

title :: Html
title = e "h1" "💡 Helium"

-- From
form :: String -> String -> Html
form idea content = ea "form" [("action", "/he/save"), ("method", "post")]
  $ unlines [ideaInput idea, contentInput content, submit "Save"]

ideaInput :: String -> Html
ideaInput idea = ea_
  "input"
  [ ("type", "text")
  , ("name", "idea")
  , ("value", idea)
  , ("placeholder", "Name your idea")]

contentInput :: String -> Html
contentInput = ea
  "textarea"
  [("name", "content"), ("placeholder", "Desribe it here"), ("rows", "5")]

-- Collection
collection :: [String] -> Html
collection [] = e "p" "No ideas yet :("
collection ideas = e "ul" (items ideas)

items :: [String] -> Html
items = concatMap item

item :: String -> Html
item idea = e "li" (link idea ("/he/" ++ idea) ++ deleteButton idea)

deleteButton :: String -> Html
deleteButton idea =
  ea "form" [("action", "/he/" ++ idea ++ "/delete"), ("method", "post")]
  $ submit "Delete"

-- Graph with mermaid
graph :: [String] -> [String] -> Html
graph [] _ = e "p" "No ideas, no graph :("
graph ideas contents = ea "div" [("class", "mermaid")]
  $ unlines ("graph TD":ideas ++ relations ideas contents ++ map click ideas)

click :: String -> String
click idea =
  "click " ++ idea ++ " \"/he/" ++ idea ++ "\" \"Go to " ++ idea ++ "\" _blank"

relations :: [String] -> [String] -> [String]
relations ideas contents = map (relation ideas) (zip ideas contents)

relation :: [String] -> (String, String) -> String
relation ideas (idea, content) = unlines
  (map (\i -> idea ++ " --> " ++ i) (filter (`isInfixOf` content) ideas))