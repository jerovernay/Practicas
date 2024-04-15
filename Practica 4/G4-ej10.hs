--a)
f1 :: Int -> Int
f1 0 = 1
f1 n = 2^n + f1 (n - 1) 

--b)
f2 :: Int -> Int -> Int
f2 1 q = q
f2 n q = q^n + f2 (n - 1) q 
