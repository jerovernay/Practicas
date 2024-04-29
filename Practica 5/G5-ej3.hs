--1. sumatoria :: [Integer] -> Integer seg´un la siguiente especificaci´on:

sumatoria :: [Integer] -> Integer
sumatoria [] = 0
sumatoria [x] = x
sumatoria (x:xs) =  x + sumatoria xs
                
-- 2. productoria :: [Integer] -> Integer seg´un la siguiente especificaci´on:

productoria :: [Integer] -> Integer
productoria [] = 0
productoria [x] = x
productoria (x:xs) = x * productoria xs

-- 3. maximo :: [Integer] -> Integer seg´un la siguiente especificaci´o

maximo :: [Integer] -> Integer
maximo [] = 0
maximo [x] = x
maximo (x:y:xs) | x > y = maximo (x:xs)
                | x < y = maximo (y:xs)

-- 4. sumarN :: Integer -> [Integer] -> [Integer] seg´un la siguiente especificaci´on:

sumarN :: Integer -> [Integer] -> [Integer]
