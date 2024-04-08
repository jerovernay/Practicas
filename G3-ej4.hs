-- a) prodInt: calcula el producto interno entre dos tuplas R × R.
prodInt :: (Float, Float) -> (Float, Float) -> Float
prodInt (a,b) (c, d) = a*c + b*d
 
-- b) todoMenor: dadas dos tuplas R×R, decide si es cierto que cada coordenada de la primera tupla es menor a la coordenada correspondiente de la segunda tupla.
todoMenor :: (Int, Int) -> (Int, Int) -> Bool
todoMenor (a, b) (c, d)| a < c && b < d = True
                       | otherwise = False

--c) distanciaPuntos: calcula la distancia entre dos puntos de R^2
distanciaPuntos :: (Float, Float) -> (Float, Float) -> Float
distanciaPuntos (x, y) (w, z) = sqrt(((w - x) ** 2)+((y - z)**2))

-- d) sumaTerna: dada una terna de enteros, calcula la suma de sus tres elementos
sumaTerna :: (Int,Int, Int) -> Int
sumaTerna (x, y, z) = x + y + z
  
--e) sumarSoloMultiplos: dada una terna de numeros enteros y un natural, calcula la suma de los elementos de la terna que
--son multiplos del numero natural. 
--Por ejemplo:
--sumarSoloMultiplos (10,-8,-5) 2 ⇝ 2
--sumarSoloMultiplos (66,21,4) 5 ⇝ 0
--sumarSoloMultiplos (-30,2,12) 3 ⇝ -18
sumarSoloMultiplos :: (Int, Int, Int) -> Int -> Int
sumarSoloMultiplos (a,b,c) d = esMulti d a + esMulti d b + esMulti d c

esMulti :: Int -> Int -> Int
esMulti x y| y `mod` x == 0 = y
           | otherwise = 0

-- f) posPrimerPar: dada una terna de enteros, devuelve la posicion del primer numero par si es que hay alguno, y devuelve 4 si son todos impares.
posPrimerPar :: (Int, Int, Int) -> Int  
posPrimerPar (x, y, z)| esPar x && x /= 0 = 1
                      | esPar y && y /= 0 = 2
                      | esPar z && z /= 0 = 3
                      | otherwise = 4
                      where esPar x = x `mod` 2 == 0 -- existe la funcion even x, se puede usar?

-- g) crearPar :: a ->b ->(a, b): crea un par a partir de sus dos componentes dadas por separado (debe funcionar para elementos de cualquier tipo).
