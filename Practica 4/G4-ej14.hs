{- Ejercicio 14. Especificar e implementar una funcion sumaPotencias :: Integer ->Integer ->Integer ->Integer que
dados tres naturales q, n, m sume todas las potencias de la forma q^a+b con 1 ≤ a ≤ n y 1 ≤ b ≤ m -}

sumaPotencias :: Integer ->Integer ->Integer ->Integer
sumaPotencias q 0 m = q^m 
sumaPotencias q n 0 = q^n
sumaPotencias q n m = q^(n + m) + sumaPotencias q (n-1) (m-1)
