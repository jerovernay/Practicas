{- Ejercicio 18. Implementar una funcion mayorDigitoPar :: Integer ->Integer segun la siguiente especificacion: -}


mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n
                | mod n 2 == 0 = n
                | n == 1 = -1
                | otherwise = mayorDigitoPar (n - 1)        -- esta mal 
