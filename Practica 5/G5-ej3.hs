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
sumarN _ [] = []
sumarN n (x:xs) = n + x : sumarN n xs

-- 5. sumarElPrimero :: [Integer] -> [Integer] seg´un la siguiente especificaci´on:

sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero [] = []
sumarElPrimero [x] = [x + x]                            
sumarElPrimero (x:y:xs) = x + y : sumarElPrimero (x:xs) 

-- otra forma

{- sumarElPrimero :: [Integer] -> [Integer]
sumarElPrimero (x:xs) = sumarN x (x:xs) -}

-- 6. sumarElUltimo :: [Integer] -> [Integer] seg´un la siguiente especificaci´on:

sumarElUltimo :: [Integer] -> [Integer]
sumarElUltimo (x:xs) = sumarN (ultimo xs) (x:xs)

longitud :: [t] -> Integer
longitud []  = 0
longitud (x:xs) = 1 + longitud xs  

ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

-- 7. pares :: [Integer] -> [Integer] seg´un la siguiente especificaci´on:

pares :: [Integer] -> [Integer]
pares [] = []
pares (x:xs) 
            | mod x 2 /= 0 = pares xs
            | otherwise = x : pares xs

-- 8. multiplosDeN :: Integer -> [Integer] -> [Integer] que dado un n´umero n y una lista xs, devuelve una lista con los elementos de xs m´ultiplos de n.

multiplosDeN :: Integer -> [Integer] -> [Integer]
multiplosDeN _ [] = []
multiplosDeN n (x:xs)
                     | mod x n /= 0 = multiplosDeN n xs
                     | otherwise = x : multiplosDeN n xs

-- 9. ordenar :: [Integer] -> [Integer] que ordena los elementos de la lista en forma creciente. 
--Sugerencia: Pensar como pueden usar la funcion maximo para que ayude a generar la lista ordenada necesaria.

ordenar :: [Integer] -> [Integer]
ordenar [] = []
ordenar [x] = [x]
ordenar (x:y:xs) | x > y = y : ordenar (x:xs)
                 | otherwise = x : ordenar (y:xs)                                --Repasarlo e intentarlo bien nuevamente
