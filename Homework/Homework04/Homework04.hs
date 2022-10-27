-- Question 1
-- Lets say you have the nested values defined bellow. How would you get the value of
-- 4 by using only pattern matching in a function?
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use if" #-}

nested :: [([Int], [Int])]
nested = [([1,2],[3,4]), ([5,6],[7,8])]

--Funvtion writen to extract 4 from nested:
getFour :: [([Int], [Int])] -> Int
getFour [(_, [_, a]), _] = a
getFour _ = 0

-- Question 2
-- Write a function that takes a list of elements of any type and, if the list has 3 or more elements, it
-- removes them. Else, it does nothing. Do it two times, one with multiple function definitions and one with
-- case expressions.

--Multiple Function definition method
randomRemoval :: [a] -> [a]
randomRemoval (_:_:_:xs) = xs
randomRemoval x = x
--randomRemoval [1,2,3,4,5,6,7,8,9] Returns: [4,5,6,7,8,9]

--Using Case expressions
randomRemoval' :: [a] -> [a]
randomRemoval' lst = case lst of
    (_:_:_:xs) -> xs
    x          -> x


-- Question 3
-- Create a function that takes a 3-element tuple (all of type Integer) and adds them together

addTuple :: (Int, Int, Int) -> Int
addTuple (x, y, z) = x + y + z

-- Question 4
-- Implement a function that returns True if a list is empty and False otherwise.

isListEmpty :: [a] ->  Bool
isListEmpty [] = True
isListEmpty _ = False


-- Question 5
-- Write the implementation of the tail function using pattern matching. But, instead of failing if
-- the list is empty, return an empty list.

--The tail function returns all values except the first value
tail' :: [a] -> [a]
tail' (x:xs) = xs
tail' [] = []


-- Question 6
-- write a case expression wrapped in a function that takes an Int and adds one if it's even. Otherwise does nothing. 
-- (Use the `even` function to check if the number is even.)

evenAddOne :: Int -> Int
evenAddOne num = case even num of
    True -> num + 1
    False -> num
    
      

