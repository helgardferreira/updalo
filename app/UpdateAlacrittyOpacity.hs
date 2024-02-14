module UpdateAlacrittyOpacity where

import Data.List (isPrefixOf)
import System.Directory (removeFile, renameFile)

-- Function to replace the opacity value in a line, if applicable
replaceOpacity :: String -> String -> String
replaceOpacity line newOpacity =
  if "opacity =" `isPrefixOf` line
    then "opacity = " ++ newOpacity
    else line

-- Function to update the file content, writing to a temp file first
updateFileContent :: String -> String -> IO ()
updateFileContent filePath newOpacity = do
  content <- readFile filePath
  let linesOfContent = lines content
      updatedLines = map (`replaceOpacity` newOpacity) linesOfContent
      tempFilePath = filePath ++ ".temp"
  writeFile tempFilePath (unlines updatedLines) -- Write to a temporary file
  removeFile filePath -- Remove the original file
  renameFile tempFilePath filePath -- Rename the temp file to the original file name
