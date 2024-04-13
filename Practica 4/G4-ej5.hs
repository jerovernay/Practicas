{- EJERCICIO 5) Implementar la funcion medioFact :: Integer ->Integer que dado n ∈ N calcula n!! = n (n−2)(n−4)· · · .
problema medioFac (n: Z) : Z {
requiere: { n ≥ 0 }

Por ejemplo:
medioFact 10 ❀ 10 ∗ 8 ∗ 6 ∗ 4 ∗ 2 ❀ 3840.
medioFact 9 ❀ 9 ∗ 7 ∗ 5 ∗ 3 ∗ 1 ❀ 945.
medioFact 0 ❀ 1. -}

medioFact :: Int -> Int 
medioFact n| n == 0 = 1
           | n == 1 = 1
           | otherwise = factorial n * factorial(n - 2)

factorial :: Int -> Int
factorial n| n == 0 = 1
           | n == 1 = 1
           | otherwise = n * factorial(n-1)
