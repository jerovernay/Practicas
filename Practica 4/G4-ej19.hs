nEsimoPrimo :: Int -> Int
nEsimoPrimo n = nEsimoPrimoAux n 0 1

nEsimoPrimoAux :: Int -> Int -> Int -> Int
nEsimoPrimoAux n c x | n == c = x - 1
                     | esPrimo c = nEsimoPrimoAux n (c + 1) (x + 1)
                     | otherwise = nEsimoPrimoAux n c (x + 1)


sumaInicialPrimos :: Int -> Bool
sumaInicialPrimos 2 = True
sumaInicialPrimos n = sumaInicialPrimosAux n 1 0

sumaInicialPrimosAux :: Int -> Int -> Int -> Bool
sumaInicialPrimosAux n c s | s == n = True
                           | s > n = False
                           | otherwise = sumaInicialPrimosAux n (c + 1) (s + nEsimoPrimo c)
