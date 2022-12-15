module Main where

import Data.Char (ord)
import Data.List
import Data.List.Split
-- divide string in 2
-- find the letter in each string that matches

-- priority
-- a-z => 1-26
-- A-Z => 27-52

inRange :: Char -> Char -> Char -> Bool
inRange minC maxC valC = (ord minC) <= (ord valC) && (ord valC) <= (ord maxC)

priority :: Char -> Int
priority a = case (inRange 'a' 'z' a) of
  True -> (ord a) - 96
  False -> (ord a) - 38

findPriority :: [String] -> Int
findPriority [a, b, c] = priority $ head $ intersect (intersect a b) c
findPriority _ = 0

main :: IO ()
main = do
  f <- readFile "day3/input.txt"
  let content = lines f
  let sumPriority = sum $ map (findPriority) (chunksOf 3 content)
  print sumPriority
  putStrLn "Hey :)"
