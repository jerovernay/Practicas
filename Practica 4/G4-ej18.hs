{- Ejercicio 18. Implementar una funcion mayorDigitoPar :: Integer ->Integer segun la siguiente especificacion: -}
mayorDigitoPar :: Integer -> Integer
mayorDigitoPar n = mayorDigitoParAux n (-1)

mayorDigitoParAux :: Integer -> Integer -> Integer
mayorDigitoParAux 0 x = x
mayorDigitoParAux n x| esDivisible ultimo 2 && ultimo > x = mayorDigitoParAux(div n 10) ultimo 
                     | otherwise = mayorDigitoParAux (div n 10) x
                    where ultimo = mod n 10

esDivisible :: Integer -> Integer -> Bool
esDivisible x y| x == y = True
               | x < y = False
               | otherwise = esDivisible(x - y) y
