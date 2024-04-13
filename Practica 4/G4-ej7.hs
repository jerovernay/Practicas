{- Ejercicio 7. Implementar la funcion todosDigitosIguales :: Integer ->Bool que determina si todos los dıgitos de un
numero natural son iguales, es decir:
problema todosDigitosIguales (n: Z) : B {
requiere: { n > 0 } -}

ultimoDigito :: Int -> Int
ultimoDigito x = mod x 10

anteUltimoDigito :: Int -> Int
anteUltimoDigito x = div x 10

todosDigitosIguales :: Int -> Bool
todosDigitosIguales x
                     | x < 10 = True
                     | otherwise = ultimoDigito x ==  ultimoDigito( anteUltimoDigito x ) && todosDigitosIguales( anteUltimoDigito x ) 
