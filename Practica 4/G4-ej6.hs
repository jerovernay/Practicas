{- Ejercicio 6. Implementar la funci´on sumaDigitos :: Integer ->Integer que calcula la suma de dıgitos de un numero
natural. Para esta funcion pueden utilizar div y mod. -}


sumaDigitos :: Int -> Int 
sumaDigitos n| n == 0 = 0
             | otherwise = mod n 10 + sumaDigitos (ultDigito n)

ultDigito :: Int -> Int
ultDigito n = div n 10
