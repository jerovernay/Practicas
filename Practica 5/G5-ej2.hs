longitud :: [t] -> Integer
longitud []  = 0
longitud (x:xs) = 1 + longitud xs  

ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

reverso :: [t] -> [t]
reverso [] = []
reverso (x:xs) = reverso xs ++ [x] 

-- 1. pertenece :: (Eq t) => t -> [t] -> Bool seg´un la siguiente especificaci´on:

pertenece :: (Eq t) => t -> [t] -> Bool
pertenece _ [] = False
pertenece n (x:xs) | n == x = True
                   | otherwise = pertenece n xs

--2. todosIguales :: (Eq t) => [t] -> Bool, que dada una lista devuelve verdadero s´ı y solamente s´ı todos sus elementos son iguales.

todosIguales :: (Eq t) => [t] -> Bool
todosIguales [] = True
todosIguales [x] = True
todosIguales (x:y:xs) | x /= y = False
                      | otherwise = todosIguales(y:xs)

-- 3. todosDistintos :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:

todosDistintos :: (Eq t) => [t] -> Bool
todosDistintos [] = True
todosDistintos [x] = True
todosDistintos (x:y:xs) | x == y = False
                        | otherwise = todosDistintos(y:xs)

--4. hayRepetidos :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:

hayRepetidos :: (Eq t) => [t] -> Bool
hayRepetidos [] =  False
hayRepetidos [x] = False
hayRepetidos (x:y:xs) | x == y = True
                      | otherwise = hayRepetidos (y:xs)

-- 5. quitar :: (Eq t) => t -> [t] -> [t], que dada una lista xs y un elemento x, elimina la primera aparici´on de x en la lista xs (de haberla).

quitar :: (Eq t) => t -> [t] -> [t]
quitar _ [] = []
quitar n (x:xs) | n == x = xs   
                | n /= x = (x:xs) 
                | otherwise = quitar n xs

--6. quitarTodos :: (Eq t ) => t -> [t] -> [t], que dada una lista xs y un elemento x, elimina todas las apariciones de x en la lista xs (de haberlas). Es decir:

quitarTodos :: (Eq t ) => t -> [t] -> [t]
quitarTodos _ [] = []
quitarTodos n (x:xs) | n == x = quitarTodos n xs
                     | otherwise = x : quitarTodos n xs 

--7. eliminarRepetidos :: (Eq t) => [t] -> [t] que deja en la lista una ´unica aparici´on de cada elemento, eliminando las repeticiones adicionales

eliminarRepetidos :: (Eq t) => [t] -> [t]
eliminarRepetidos [] = []
eliminarRepetidos [x] = [x]
eliminarRepetidos (x:y:xs) | hayRepetidos(x:y:xs) == False = (x:y:xs)
                           | x == y = x : quitarTodos x (y:xs)
                           | otherwise = x : eliminarRepetidos (y:xs)

--8. mismosElementos :: (Eq t) => [t] -> [t] -> Bool, que dadas dos listas devuelve verdadero si y solamente si ambas listas contienen los mismos elementos, sin tener en cuenta repeticiones, es decir:

mismosElementos :: (Eq t) => [t] -> [t] -> Bool
mismosElementos l1 l2 = mismosElementosAux l1 l1 l2 l2

mismosElementosAux :: (Eq t) => [t] -> [t] -> [t] -> [t] -> Bool
mismosElementosAux l1 [] l2 [] = True
mismosElementosAux l1 [] l2 (y:ys)
                                  | pertenece y l1 = mismosElementosAux l1 [] l2 ys
                                  | otherwise = False
mismosElementosAux l1 (x:xs) l2 []
                                  | pertenece x [] = mismosElementosAux l1 xs l2 []
                                  | otherwise = False
mismosElementosAux l1 (x:xs) l2 (y:ys)
                                      | pertenece x l2 = mismosElementosAux l1 xs l2 (y:ys)
                                      | otherwise = False

-- 9. capicua :: (Eq t) => [t] -> Bool seg´un la siguiente especificaci´on:

{- capicua :: (Eq t) => [t] -> Bool
capicua [] = False
capicua [x] = True                                      -- Aclaro en caso de que solo haya o un caracter o un numero solo. Como no se la regla general dee capìcua, supongo que es "True", porque se lee de la misma forma para mabos lados
capicua (x:xs) | reverso (x:xs) == (x:xs) = True
               | otherwise = False
 -}                                         -- Puede hacerse el mismo caso mas simple. 
capicua :: (Eq t) => [t] -> Bool
capicua [] = False                                    
capicua l = reverso l == l

