longitud :: [t] -> Integer
longitud [] = 0
longitud (x:xs) = 1 + longitud xs

--Ejercicio 4. a) Definir las siguientes funciones sobre listas de caracteres, interpretando una palabra como una secuencia de caracteres sin blancos:

-- a) sacarBlancosRepetidos :: [Char] -> [Char], que reemplaza cada subsecuencia de blancos contiguos de la primera lista por un solo blanco en la lista resultado.

sacarBlancosRepetidos :: [Char] -> [Char]
sacarBlancosRepetidos [] = [] 
sacarBlancosRepetidos [x] = [x]
sacarBlancosRepetidos (x:y:xs) | x == ' ' && y == ' ' = sacarBlancosRepetidos xs
                               | otherwise = x : sacarBlancosRepetidos(y:xs)

-- b) contarPalabras :: [Char] -> Integer, que dada una lista de caracteres devuelve la cantidad de palabras que tiene. 

contarPalabras :: [Char] -> Integer
contarPalabras l1 = contarPalabrasAux(sacarBlancosRepetidos(sacarPrimerBlanco l1))

contarPalabrasAux ::[Char] -> Integer
contarPalabrasAux [] = 0
contarPalabrasAux [x] = 1
contarPalabrasAux (x:xs) 
                        | x == ' ' = 1 + contarPalabrasAux xs 
                        | otherwise = contarPalabrasAux xs

sacarPrimerBlanco :: [Char] -> [Char]
sacarPrimerBlanco [] = []
sacarPrimerBlanco [x] = [x]
sacarPrimerBlanco (x:xs) | x == ' ' = xs
                         | otherwise = x:xs

-- c) palabras :: [Char] -> [[Char]], que dada una lista arma una nueva lista con las palabras de la lista original

palabras :: [Char] -> [[Char]]
palabras [] = []
palabras (x:xs) = sacarPrimerBlanco (x:xs)

palabrasAux :: [Char] -> [[Char]]
palabrasAux [] = []
palabrasAux (x:xs) | longitud 
