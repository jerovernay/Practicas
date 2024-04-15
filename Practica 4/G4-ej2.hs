-- Ejercicio 2. Implementar una funci´on parteEntera :: Float ->Integer seg´un la siguiente especificaci´on:
-- problema parteEntera (x: R) : Z {
-- requiere: { T rue }
-- asegura: { resultado ≤ x < resultado + 1 }
-- }

parteEntera :: Float -> Integer
parteEntera n
             | n < 1 && n > 0 = 0
             | n > -1 && n <= 0 = -1
             | n > -1 = 1 + parteEntera(n - 1)
             | otherwise = -1 + parteEntera(n + 1)
