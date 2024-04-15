{- Ejercicio 9. Implementar una funcion esCapicua :: Integer ->Bool que dado n ∈ N≥0 determina si n es un numero capicua. -}

darVuelta :: Int -> Int -> Int
darVuelta 0 m = m
darVuelta n m = darVuelta (div n 10) (m * 10 + (n `mod` 10))

esCapicua :: Int -> Bool
esCapicua n = n == darVuelta n 0
