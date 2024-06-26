-- a) absoluto
absoluto :: Int -> Int
absoluto x| x >= 0 =x
          | otherwise = -x
          
-- b) maximoabsoluto
maximoAbsoluto :: Int -> Int -> Int
maximoAbsoluto x y| x > y = absoluto(x)
                  | y > x = absoluto(y)

-- c) maximo3
maximo3 :: Int -> Int -> Int -> Int
maximo3 x y z| x > y && x > z = x
             | y > x && y > z = y
             | z > x && z > y = z

-- d) algunoEs0
algunoEs0 :: Float -> Float -> Bool
algunoEs0 x y| x == 0 || y== 0 = True
             | otherwise= False

-- e) ambosSon0
ambosSon0 :: Float -> Float -> Bool
ambosSon0 x y| x == 0 && y == 0 = True
             | otherwise = False

-- f) mismoIntervalo
mismoIntervalo :: Float -> Float -> Bool
mismoIntervalo x y| perteneceInter(x) == perteneceInter(y) = True
                  | otherwise = False

perteneceInter :: Float -> Int
perteneceInter x| x < 3 = 1
                | x >= 3 && x < 7 = 2
                | x >= 7 =3

-- g) sumaDistintos
sumaDistintos :: Int -> Int -> Int -> Int
sumaDistintos x y z| x /= y && x /= z && y /= z = x + y + z
                   | x == y && x == z = 0
                   | x == y = x + z
                   | x == z = x + y
                   | y == z = x + y
-- h) esMultiploDe
esMultiploDe :: Int -> Int -> Bool
esMultiploDe x y| x `mod` y == 0 = True
                | otherwise = False
                
-- i) digitoUnidades
--digitoUnidades = [1,2]            <-- En que caso es esto incorrecto? No cumple acaso con la condicion?
--extraigoUno = drop 1 digitoUnidades
digitoUnidades :: Int -> Int
digitoUnidades x = x `mod` 10 

-- j) digitoDecenas
digitoDecenas :: Int -> Int
digitoDecenas x = digitoUnidades (div x 10)
