--Ejercicio 5. Definir las siguientes funciones sobre listas:
--1. sumaAcumulada :: (Num t) => [t] -> [t] seg´un la siguiente especificaci´on:

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x : sumaAcumulada (x+y:xs)

-- 2. descomponerEnPrimos :: [Integer] -> [[Integer]] seg´un la siguiente especificaci´on:

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos [] = []
descomponerEnPrimos (x:xs) = [descomponer x 1]++ descomponerEnPrimos xs
  where descomponer :: Integer -> Integer -> [Integer]
        descomponer 1 _ = []
        descomponer n i | mod n (nEsimoPrimo i) == 0 = nEsimoPrimo i : descomponer(div n (nEsimoPrimo i)) i
                        | otherwise = descomponer n (i+1)


esPrimo :: Integer -> Bool
esPrimo n = n > 1 && menorDivisor n == n

menorDivisor :: Integer -> Integer 
menorDivisor n = menorDivisor2 n 2
  where menorDivisor2 n i | mod n i == 0 = i
                          | otherwise = menorDivisor2 n (i + 1)

nEsimoPrimo :: Integer -> Integer
nEsimoPrimo n = nEsimoPrimoAux n 0 1
  where nEsimoPrimoAux n c x | n == c = x - 1
                             | esPrimo c = nEsimoPrimoAux n (c + 1) (x +1)
                             | otherwise = nEsimoPrimoAux n c (x + 1)
