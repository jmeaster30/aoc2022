module Main where

-- win: 6
-- tie: 3
-- lose: 0

-- rock:  1 (A/X)
-- paper: 2 (B/Y)
-- scissors: 3 (C/Z)

lineToScore :: String -> Int
lineToScore s = do
  let codes = words s
  case codes of
    ["A", "X"] -> 0 + 3 -- rock lose
    ["A", "Y"] -> 3 + 1 -- rock draw
    ["A", "Z"] -> 6 + 2 -- rock win
    ["B", "X"] -> 0 + 1 -- paper lose
    ["B", "Y"] -> 3 + 2 -- paper draw
    ["B", "Z"] -> 6 + 3 -- paper win
    ["C", "X"] -> 0 + 2 -- scissors lose
    ["C", "Y"] -> 3 + 3 -- scissors draw
    ["C", "Z"] -> 6 + 1 -- scissors win
    _ -> 0
    

main :: IO ()
main = do
  f <- readFile "day2/input.txt"
  let content = lines f
  let score = sum $ map (lineToScore) content
  print score
  putStrLn "Hey :)"