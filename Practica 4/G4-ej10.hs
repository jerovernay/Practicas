--a)
f1 :: Int -> Int
f1 0 = 1
f1 n = 2^n + f1 (n - 1) 

--b)
f2 :: Int -> Int -> Int
f2 1 q = q
f2 n q = q^n + f2 (n - 1) q 

--c)
f3 :: Int -> Int -> Int
f3 1 q = q^(2*1) 
f3 n q = q^(2*n) + f3 (n - 1) q

--d)
f4 :: Int -> Int -> Int -> Int
f4 i q n| i == n = q^n  
        | otherwise = q^i + (f4 (i - 1) q n)
