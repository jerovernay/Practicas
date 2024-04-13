 {- Ejercicio 3. Implementar la funci´on esDivisible :: Integer ->Integer ->Bool 
que dados dos n´umeros naturales determinar si el primero es divisible por el segundo.
 No est´a permitido utilizar las funciones mod ni div. -}

esDivisible :: Int -> Int -> Bool
esDivisible x y| x == y = True
               | x < y = False
               | otherwise = esDivisible(x - y) y
