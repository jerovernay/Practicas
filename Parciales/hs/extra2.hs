
{- 1) Cantidad de caracteres en minúscula [2 puntos]
problema cantMinuscula (mensaje: String) : Z {
  requiere: {True}
  asegura: {res = cantidad de caracteres en minúscula en mensaje}
 -}


cantMinuscula :: String -> Integer
cantMinuscula [] = 0
cantMinuscula [x] = 1
cantMinuscula (x:xs)
  | esMinuscula x = 1 + cantMinuscula xs
  | otherwise = cantMinuscula xs


esMinuscula :: Char -> Bool
esMinuscula x = x >= 'a' && x <= 'z'
