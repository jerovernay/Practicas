{- Ejercicio 4. Implementar la funci´on sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros n n´umeros
impares. Por ejemplo: sumaImpares 3 ❀ 1+3+5 ⇝ 9. -}

sumaImpares :: Int -> Int
sumaImpares n 
             | 2*n - 1 <= 0 = 0
             | 2*n - 1 == 1 = 1
             | otherwise = sumaImpares n + sumaImpares(n - 1) + sumaImpares(n - 2)
    -- no me sale!
