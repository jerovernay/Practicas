{- Ejercicio 17. Implementar la funci´on esFibonacci :: Integer ->Bool seg´un la siguiente especificaci´on:
problema esFibonacci (n: Z) : B {
requiere: { n ≥ 0 }
asegura: { resultado = true ↔ n es alg´un valor de la secuencia de Fibonacci definida en el ejercicio 1}
} -}

esFibonacci :: Int -> Bool
esFibonacci n = esPartedeFibo n 1

esPartedeFibo :: Int -> Int -> Bool
esPartedeFibo n x 
                 | n == fib x = True
                 | otherwise = esPartedeFibo n (x + 1)

fib :: Int -> Int
fib n
     | n == 0 = 0
     | n == 1 = 1
     | otherwise = fib(n - 1) + fib(n - 2)
