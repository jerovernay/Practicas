{- Lo cual resulta en la siguiente definicion recursiva: a1 = 2, an = 2 + 1
                                                                        an−1
Utilizando esta sucesion, especificar e implementar
una funci´on raizDe2Aprox :: Integer ->Float que dado n ∈ N devuelva la aproximaci´on de √
2 definida por √
2 ≈ an−1.
Por ejemplo:
raizDe2Aprox 1 ⇝ 1
raizDe2Aprox 2 ⇝ 1,5
raizDe2Aprox 3 ⇝ 1,4 -}

a :: Integer -> Float 
a 1 = 2
a n = 2 + (1 / a(n-1))

raizDe2Aprox :: Integer -> Float
raizDe2Aprox n = a n - 1
