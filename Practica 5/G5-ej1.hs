-- 1. longitud :: [t] -> Integer, que dada una lista devuelve su cantidad de elementos.
{-# OPTIONS_GHC -Wno-unrecognised-pragmas #-}
{-# HLINT ignore "Use foldr" #-}

longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

-- 2. ultimo :: [t] -> t seg´un la siguiente especificaci´on:

ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

-- 3. principio :: [t] -> [t] seg´un la siguiente especificaci´on:

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

-- 4. reverso :: [t] -> [t] seg´un la siguiente especificaci´on:

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x] 
