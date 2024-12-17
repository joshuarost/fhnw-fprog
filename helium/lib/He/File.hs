module He.File where

import           System.Directory (listDirectory, removeFile)

baseDir :: String
baseDir = "ideas/"

save :: FilePath -> String -> IO ()
save path content = do
  writeFile (baseDir ++ path) content

readIdea :: FilePath -> IO String
readIdea path = do
  readFile (baseDir ++ path)

getIdeas :: IO [String]
getIdeas = listDirectory baseDir

removeIdea :: FilePath -> IO ()
removeIdea path = do
  removeFile (baseDir ++ path)