-- Ejercicio 11. a) Especificar e implementar una funci´on eAprox :: Integer ->Float que aproxime el valor del n´umero e a partir de la siguiente sumatoria:

eAprox :: Integer -> Float
eAprox 0 = 1
eAprox n = (1 / factorial n) + eAprox(n - 1)

factorial :: Integer -> Float
factorial n | n == 0 = 1
            | otherwise = fromIntegral n * factorial(n-1)

--b) 
e :: Float
e = eAprox 10
