{- Ejercicio 8. Implementar la funcion iesimoDigito :: Integer ->Integer ->Integer que dado un n ∈ N≥0 y un i ∈ N
menor o igual a la cantidad de dıgitos de n, devuelve el i-´esimo d´ıgito de n. -}

cantDigitos :: Int -> Int
cantDigitos x 
             | x < 10 = 1 
             | otherwise = 1 + cantDigitos (ultimoDigito x)
             where ultimoDigito x = div x 10                                      -- En general me cuesta entender el problema, no encuentro la correlacion entre la formula y cual es mi objetivo

iesimoDigito :: Int -> Int -> Int
iesimoDigito n i = mod (div n 10^(cantDigitos n - i)) 10        
