f :: Int -> Int
f 1 = 8
f 4 = 131
f 16 = 16

g :: Int -> Int
g 8 = 16
g 16 = 4
g 131 = 1

h :: Int -> Int
h x = f (g x)

k :: Int -> Int
k x = g (f x) 
