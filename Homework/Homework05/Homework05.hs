
-- Create a higher-order function that takes 3 parameters: A function and the two parameters that that function takes, and
-- flips the order of the parameters.
-- For example this: `(/) 6 2` returns `3`. But this: `flip' (/) 6 2` returns `0.3333333333`
 

funcHighOrd :: (a -> a -> a) -> a -> a -> a 
funcHighOrd operatorFunc x y = operatorFunc y x

-- Alternative from solutions is:

flip' :: (a -> b -> c) -> b -> a -> c  
flip' f y x = f x y 


-- Create the `uncurry'` function that converts a curried function to a function on pairs. So this: `(+) 1 2` that returns `3` can be written as
-- `uncurry' (+) (1,2)` (with the two different arguments inside a pair).

--uncurry' :: (a -> a -> a) -> ((a, a) -> a)
--uncurry' funcEE (x,y) = funcEE x y 

-- From solutions:
uncurry' :: (a -> b -> c) -> ((a, b) -> c)
uncurry' f (x,y) =  f x y


-- Create the `curry'` function that converts an uncurried function to a curried function. So this: `fst (1,2)` that returns `1` can be written as
-- `curry' fst 1 2` (with the tuple converted into two different arguments).

curry' :: ((a, b) -> a) -> (a -> b -> a)
curry' f x y = f (x, y) 

--From solutions:

curry'' :: ((a, b) -> c) -> a -> b -> c
curry'' f x y =  f (x, y)

-- Use higher-order functions, partial application, and point-free style to create a function that checks if a word has an uppercase letter.
-- Start with using just higher-order functions and build from there. 

funcA :: [Char] -> Bool
funcA = any (`elem` ['A'..'Z'])

--From solutions:

hasUppercase :: String -> Bool
hasUppercase = any (`elem` ['A'..'Z'])





-- Create the `count` function that takes a team ("Red", "Blue", or "Green") and returns the amount of votes the team has inside `votes`.

votes :: [String]
votes = ["Red", "Blue", "Green", "Blue", "Blue", "Red"]

count :: String -> Int
count x = length . filter (== x) $ votes  

--From solutions:
count' :: String -> Int
count' x = length . filter (== x) $ votes

--How it would be without the . and $:
count'' :: String -> Int
count'' x = length ((filter (== x)) (votes))



-- Create a one-line function that filters `cars` by brand and then checks if there are any left.

cars :: [(String,Int)]
cars = [("Toyota",0), ("Nissan",3), ("Ford",1)]

carBrands :: String -> Bool
carBrands x = any 
