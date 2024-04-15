{- Ejercicio 13. Especificar e implementar la siguiente funcion: -}
f1 :: Int -> Int -> Int
f1 0 m = 0
f1 n 0 = 1
f1 n m = n^m + f1 (n-1) (m -1)
