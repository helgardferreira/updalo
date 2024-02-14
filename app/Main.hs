module Main where

import System.Environment (getArgs, getEnv)
import UpdateAlacrittyOpacity

getAlacrittyConfigPath :: IO String
getAlacrittyConfigPath = do
  homeDir <- getEnv "HOME"
  let configPath = homeDir ++ "/.config/alacritty/alacritty.toml"
  return configPath

main :: IO ()
main = do
  -- Surely there's a more elegant way to do this
  configPath <- getEnv "HOME" >>= \homeDir -> return $ homeDir ++ "/.config/alacritty/alacritty.toml"
  -- Expecting the first argument to be the new opacity value
  args <- getArgs
  case args of
    [newOpacity] -> updateFileContent configPath newOpacity
    _anyOtherArgs -> putStrLn "Usage: updalo <newOpacityValue>"
