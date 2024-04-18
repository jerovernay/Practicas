longitud :: [t] -> Integer
longitud []  = 0
longitud (x:xs) = 1 + longitud xs  

ultimo :: [t] -> t
ultimo (x:xs) | longitud xs == 0 = x
              | otherwise = ultimo xs

principio :: [t] -> [t]
principio [x] = []
principio (x:xs) = x : principio xs

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
todosDistintos [] = False
todosDistintos [x] = True
todosDistintos (x:y:xs) | x == y = False                                                    -- no termino de sacarlo en el caso de que no esten todos a la par
                        | todosDistintos (y:xs) == todosDistintos xs = False
                        | otherwise = True
