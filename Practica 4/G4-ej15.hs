{- Ejercicio 15. Especificar e implementar una funcion sumaRacionales :: Integer ->Integer ->Float que dados dos
naturales n, m sume todos los numeros racionales de la forma p/q con 1 ≤ p ≤ n y 1 ≤ q ≤ m, es deci -}

sumaRacionales :: Integer ->Integer ->Float
sumaRacionales 0 m = 0
sumaRacionales n 0 = fromIntegral n
sumaRacionales n m = fromIntegral n / fromIntegral m + sumaRacionales (n - 1) (m - 1)
