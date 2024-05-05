{- Ejercicio 4. Implementar la funci´on sumaImpares :: Integer ->Integer que dado n ∈ N sume los primeros n n´umeros
impares. Por ejemplo: sumaImpares 3 ❀ 1+3+5 ⇝ 9. -}

sumaImpares :: Int -> Int 
sumaImpares 0 = 0
sumaImpares n = impares n + sumaImpares (n - 1)
  where impares n = 2*n - 1
