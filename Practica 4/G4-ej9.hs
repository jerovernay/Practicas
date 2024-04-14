{- Ejercicio 9. Implementar una funcion esCapicua :: Integer ->Bool que dado n ∈ N≥0 determina si n es un numero capicua. -}

esCapicua :: Int -> Bool
esCapicua x| x < 10 = True
           
ultimoDigito :: Int -> Int 
ultimoDigito x = mod x 10

primerDigito :: Int -> Int
primerDigito x| x < 10 = x
              | otherwise = primerDigito(div x 10)

sacarDigito :: Int -> Int
sacarDigito x = 
