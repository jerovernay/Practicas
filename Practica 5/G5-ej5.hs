--Ejercicio 5. Definir las siguientes funciones sobre listas:
--1. sumaAcumulada :: (Num t) => [t] -> [t] seg´un la siguiente especificaci´on:

sumaAcumulada :: (Num t) => [t] -> [t]
sumaAcumulada [] = []
sumaAcumulada [x] = [x]
sumaAcumulada (x:y:xs) = x : sumaAcumulada (x+y:xs)

-- 2. descomponerEnPrimos :: [Integer] -> [[Integer]] seg´un la siguiente especificaci´on:

descomponerEnPrimos :: [Integer] -> [[Integer]]
descomponerEnPrimos (x:xs) = descomponerEnPrimosAux (x:xs) []

descomponerEnPrimosAux :: [Integer] -> [Integer] -> [[Integer]]
descomponerEnPrimosAux [] [] = [[]]
descomponerEnPrimosAux [] [x] = [[x]]
descomponerEnPrimosAux (x:xs) = factorPrimo x 2 : descomponerEnPrimosAux xs []
                        where factorPrimo n =
