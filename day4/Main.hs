module Main where

import Data.List
import Data.List.Split
import Data.Char (ord)

getValues :: String -> (Int, Int, Int, Int)
getValues x = do
  let [a, b] = splitOn "," x
  let [minA, maxA] = map (read::String->Int) $ splitOn "-" a
  let [minB, maxB] = map (read::String->Int) $ splitOn "-" b
  (minA, maxA, minB, maxB)

isSubset :: (Int, Int, Int, Int) -> Bool
isSubset (minA, maxA, minB, maxB) = (minA <= minB && minB <= maxA) 
                                || (minA <= maxB && maxB <= maxA)
                                || (minB <= minA && minA <= maxB)
                                || (minB <= maxA && maxA <= maxB)

main :: IO ()
main = do
  f <- readFile "day4/input.txt"
  let result = length $ filter isSubset $ map getValues $ lines f
  print result
  putStrLn ""