-- Question 1
-- Write a function that checks if the monthly consumption of an electrical device is bigger, equal, or smaller than the maximum allowed and
-- returns a message accordingly. 
-- The function has to take the hourly consumption of an electrical device, the hours of daily use, and the maximum monthly consumption allowed.
-- (Monthly usage = consumption (kW) * hours of daily use (h) * 30 days).

maxConsumed :: Int -> Int -> Int -> [Char]
maxConsumed kW h max
        |totalConsumtion < max = "The device consumes a smaller amount than the monthly maximum, saving: " ++ show (max - totalConsumtion) ++ " kWh per month"
        |totalConsumtion == max = "The device conumes the same as the monthly maximum limit." 
        |totalConsumtion > max = "The device consumes a bigger amount than the monthly maximum limit in excess off: " ++ show (totalConsumtion - max) ++ " kWh per month"
        |otherwise = "Nothing"
        where 
        totalConsumtion = kW * h * 30



-- Question 2
-- Prelude:
-- We use the function `show :: a -> String` to transform any type into a String.:
-- So `show 3` will produce `"3"` and `show (3 > 2)` will produce `"True"`.

-- In the previous function, return the excess/savings of consumption as part of the message.


-- Question 3
-- Write a function that showcases the advantages of using let expressions to split a big expression into smaller ones.
-- Then, share it with other students in Canvas.

-- By Hermaans De Wet 2022/10/20
-- We will use the let expression to simplify equating damage dealt to a defending character if any and return its new health if it recieved damage from the attacking character.
-- dealtDamage = maxDamageDealt * DefenderResistanceMultiplier = (atkAtacker - defDef) * (atkPierce / defResistance)
-- mirrorDamage = maxDamageMirror *  AtackerResistanceMultiplier = (atkDefender - defAtacker) * (defPierce/atkResistance)
-- newHealthDefender = defHealth - dealtDamage 
-- newHealthAttacker = atkHealt - mirrorDamage

damageCalculations :: (Double, Double, Double, Double, Double) -> (Double, Double, Double, Double, Double) -> (Double, Double)
damageCalculations  (atkAtk, defAtk, pierceAtk, resistanceAtk, healthAtk) (atkDef, defDef, pierceDef, resistanceDef, healthDef) = 
    let dealtDamage = (atkAtk- defDef) * (pierceAtk / resistanceDef)
        mirrorDamage = (atkDef - defAtk) * (pierceDef / resistanceAtk)
        newHealthDefender = healthDef - dealtDamage
        newHealthAttacker = healthAtk - mirrorDamage
    in if atkAtk > defDef then  (healthAtk, newHealthDefender) else (newHealthAttacker, healthDef)



-- Question 4
-- Write a function that takes in two numbers and returns their quotient such that it is not greater than 1.
-- Return the number as a string, and in case the divisor is 0, return a message why the division is not
-- possible. To implement this function using both guards and if-then-else statements.  

funcQuotient :: Double -> Double -> String
funcQuotient numerator denominator 
        |numerator < denominator = if denominator /= 0 then show (numerator / denominator) else "You cannot divide by zero!"
        |numerator > denominator = if numerator /= 0 then show (denominator / numerator) else "You cannot divide by zero!"
        |otherwise = "Nothing"
        


-- Question 5
-- Write a function that takes in two numbers and calculates the sum of squares for the product and quotient
-- of those numbers. Write the function such that you use a where block inside a let expression and a
-- let expression inside a where block. 

weirdFunc :: Double -> Double -> Double
weirdFunc a b = let sqrtProd = sqrt abProd where abProd = a * b
                in sqrtProd + sqrtQuot
                where sqrtQuot = let abQuot = a / b in sqrt abQuot

