{-# LANGUAGE OverloadedStrings #-}

-- | Dieses Modul enthält den Einstiegspunkt um den Webserver zu starten.
module Web where

import Control.Monad.IO.Class (liftIO)
import qualified Data.Text.Lazy as T
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import qualified Prereq
import System.Directory (listDirectory)
import Web.Scotty (captureParam, file, formParam, get, html, middleware, post, scotty, setHeader)

-- | Haupteinstiegspunkt, startet den Webserver.
main :: IO ()
main = scotty 4000 $ do
  middleware logStdoutDev

  get "/" $ file "static/index.html"

  get "/styles.css" $ do
    setHeader "Content-Type" "text/css"
    file "static/styles.css"

  post "/upload" $ do
    filename <- formParam "filename" -- Hidden Parameter aus dem Form
    extension <- formParam "extension" -- Extension Parameter aus dem Form
    content <- formParam "content" -- Content Parameter aus dem Form
    let fullName = filename ++ "." ++ extension
    -- IO Actions müssen mit liftIO zu einer ActionM 'angehoben' werden
    liftIO (writeFile ("data/" ++ fullName) content)
    html (T.pack (Prereq.createPage ("Wrote " ++ content ++ " to data/" ++ fullName)))

  get "/list/:foldername" $ do
    folderName <- captureParam "foldername" -- Pfad Parameter aus der URL
    files <- liftIO (listDirectory folderName)
    html (T.pack (Prereq.createPage ("Number of files: " ++ show (length files) ++ " in " ++ folderName)))
