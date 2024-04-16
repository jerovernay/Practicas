{- Ejercicio 16. Recordemos que un entero p > 1 es primo si y solo si no existe un entero k tal que 1 < k < p y k divida a p. -}

-- a) Implementar menorDivisor :: Integer ->Integer que calcule el menor divisor (mayor que 1) de un natural n pasado como parametro 

menorDivisor :: Integer ->Integer
menorDivisor n = divisor n 2

divisor :: Integer -> Integer -> Integer
divisor n x 
            | mod n 2 == 0 = 2
            | otherwise = divisor n (x + 1)

esPrimo :: Integer -> Bool
esPrimo n = n == menorDivisor n

{- esPrimo :: Integer -> Bool -}

-- ) Implementar la funci´on esPrimo :: Integer ->Bool que indica si un n´umero natural pasado como par´ametro es primo
