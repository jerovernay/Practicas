module Hoy where


{- 1) Cantidad de caracteres en minúscula [2 puntos]
problema cantMinuscula (mensaje: String) : Z {
  requiere: {True}
  asegura: {res = cantidad de caracteres en minúscula en mensaje}
 -}


cantMinuscula :: String -> Integer
cantMinuscula [] = 0
cantMinuscula [x] 
  | esMinuscula x = 1
  | not (esMinuscula x) = 0
cantMinuscula (x:xs)
  | esMinuscula x = 1 + cantMinuscula xs
  | otherwise = cantMinuscula xs


esMinuscula :: Char -> Bool
esMinuscula x = x >= 'a' && x <= 'z'        --importante, lo saque de gpt obvio

{- 2) Mensaje con cantidad de cambios máxima [3 puntos]
problema maximoCambios (mensajes: seq< String >) : String {
  requiere: {| mensajes | > 0}
  asegura: {res = mensaje perteneciente a mensajes tal que la cantidad de cambios (letras minúsculas a reemplazar) que 
  tienen que hacerse para codificarlo es máxima. En caso de haber más de un mensaje máximo, res puede ser cualquiera de ellos.} -}

maximoCambios :: [String] -> String 
maximoCambios [] =  "ninguno"
maximoCambios [x] = x
maximoCambios (x:y:xs)
  | cantMinuscula x >= cantMinuscula y = maximoCambios (x:xs)
  | otherwise = maximoCambios (y:xs)



{- 3) Desplazar [2 puntos]
problema desplazar (a: Char, n: Z) : Char 
{25 <= n <= 25}
asegura: {ord a >= ord 'a' ∧ ord a <= ord 'z' ∧ 0 <= n <= 25 → res es el caracter que se encuentra a n posiciones más adelante en el alfabeto (si se llega al final se comienza desde el principio)}
asegura: {ord a >= ord 'a' ∧ ord a <= ord 'z' ∧ -25 <= n < 0 → res es el caracter que se encuentra a n posiciones más atrás en el alfabeto (si se llega al principio se comienza desde el final)}
asegura: {¬ (ord a >= ord 'a' ∧ ord a <= ord 'z') → res = a }

Ejemplos:

desplazar 'b' 2 devuelve 'd'
desplazar 'b' -1 devuelve 'a'
desplazar 'x' 4 devuelve 'b'
desplazar 'b' -3 devuelve 'y'
desplazar ';' 2 devuelve ';' -} 

-- n positivo = desplazoAdelante
-- n negativo = desplazoAtras
-- n no es un entero = n

desplazar :: Char -> Integer -> Char
desplazar l n 
  | not esLetra = l
  | n >= (-25) && n <= 25 && esLetra = desplazarAux l n
  where esLetra = l >= 'a' && l <= 'z'

desplazarAux :: Char -> Integer -> Char
desplazarAux l n
  | n > 0 = proximo l n
  | n < 0 = anterior l n

proximo :: Char -> Integer -> Char
proximo l 0 = l                           -- tambien saque la variable sucesor de gpt, preguntando como hacer esto sin crear 40 auxiliares de los auxiliares, preguntar a Halpe en todo caso, si lo resolvio distinto y como.
proximo 'z' n = proximo 'a' (n - 1)       
proximo l n = proximo (succ l) (n - 1)    -- esta claro que uso una variable que no esta permitida en el rango pero sino es imposible hacer la funcion con los paramtros dados, ya que si no los uso tengo que crear un nuevo auxiliar que se llama "antes" y otro "despues" para crear dos nuevas funciones y estas funciones, ademas, van a necesitar auxiliares porque no tenes material suficiente para dteeminarlos con los parametros dado. 

anterior :: Char -> Integer -> Char
anterior l 0 = l
anterior 'a' n = anterior 'z' (n + 1)
anterior l n = anterior (pred l) (n + 1)


{- ) Codificar mensaje [2 puntos]
problema codificar (mensaje: String, n: Z) : String {
  requiere: {0 <= n <= 25}
  asegura: {res = versión codificada del mensaje, donde cada caracter en minúscula del mensaje se sustituye por
  la letra minúscula que se encuentra n posiciones más adelante en el alfabeto. Los caracteres que no son minúscula no se sustituyen.}
 -}

-- Que piden:
-- reemplazar todas las minusculas por otras minusculas n posiciones adelante, es decir puede usarse la funcion desplazar 
-- si no es minuscula, entonces se deja como esta

codificar :: String -> Integer -> String
codificar [] _ = []
codificar (x:xs) n = reemplazo x n : codificar xs n

reemplazo :: Char -> Integer -> Char
reemplazo l 0 = l
reemplazo l n 
  | not (esMinuscula l) = l
  | otherwise = desplazar l n


{- 5) Decodificar mensaje [1 puntos]
problema decodificar (mensaje: String, n: Z) : String {
  requiere: {0 <= n <= 25}
  asegura: {res = versión decodificada del mensaje, donde cada caracter en minúscula del mensaje se sustituye por 
  la letra minúscula que se encuentra n posiciones más atrás en el alfabeto. Los caracteres que no son minúscula no se sustituyen.} -}

decodificar :: String -> Integer -> String
decodificar [] _ = []
decodificar (x:xs) n = reemplazo2 x n : decodificar xs n 

reemplazo2 ::  Char -> Integer -> Char
reemplazo2 l 0 = l
reemplazo2 l n 
  | not (esMinuscula l) = l
  | otherwise = desplazar l (-n)
