module Main where

import System.Environment (getArgs)
import UpdateAlacrittyOpacity

main :: IO ()
main = do
  -- Expecting the first argument to be the new opacity value
  args <- getArgs
  case args of
    [newOpacity] -> updateFileContent "/Users/helgardferreira/.config/alacritty/alacritty.toml" newOpacity
    _anyOtherArgs -> putStrLn "Usage: updalo <newOpacityValue>"
