module Main where

import qualified Data.ByteString.Lazy.Char8 as L8
import           Network.HTTP.Client
import           Network.HTTP.Client.TLS
import           System.Environment

-- cabal repl
-- :main Arg1
-- :set args Arg1
-- cabal run webclient Arg1
main :: IO ()
main = do
  manager <- newManager tlsManagerSettings
  [location] <- getArgs
  let url = buildURL location
  request <- parseRequest url
  res <- httpLbs request manager
  let body = responseBody res
  L8.putStrLn body

buildURL location = "https://wttr.in/~" ++ location ++ "?format=3"