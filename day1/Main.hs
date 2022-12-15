module Main where

main :: IO ()
main = do
  f <- readFile "day2/input.txt"
  let content = lines f
  putStrLn "Hey :)"