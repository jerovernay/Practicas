# Ejercicio 1
#
#  problema ultima_aparicion (s: seq⟨Z⟩, e: Z) : Z {
#    requiere: {e pertenece a s }
#    asegura: {res es la posición de la última aparición de e en s}
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,100,0,100,0,-1,-1]
#   e = 0
#   lastE = 7

def ultima_aparicion(s: list[int], e: int) -> int:
    posicion: int = 0       # es un requerimiento que e pertenezca s, por lo que minimo debe aparecer en la posicion inicial
    longitud = len(s)

    while posicion < longitud:
        if e == s[longitud -1 - posicion]: 
            return longitud -1 - posicion
        posicion += 1

    return posicion

print(ultima_aparicion([1,2,3,4,3,5], 3)) #4
print(ultima_aparicion([-1,4,0,4,100,0,100,0,-1,-1], 100)) #6
print(ultima_aparicion([-1,4,0,4,100,0,100,0,-1,-1], 0)) #7
print()
print("Aqui termina el Ej 1")
print()

# Ejercicio 2
#
#  problema elementos_exclusivos (s: seq⟨Z⟩, t: seq⟨Z⟩) : seq⟨Z⟩ {
#    requiere: -
#    asegura: {Los elementos de res pertenecen o bien a s o bien a t, pero no a ambas }
#    asegura: {res no tiene elementos repetidos }
#  }

# Por ejemplo, dados
#   s = [-1,4,0,4,3,0,100,0,-1,-1]
#   t = [0,100,5,0,100,-1,5]
#   Deberia devolver al menos una combinacion de [3,4,5]

def pertenece(s: list, e = int) -> bool:

    for i in range(len(s)):
        if s[i] == e:
            return True
    return False

def pertenece_a_ambas(l1: list , l2: list, e:int) -> bool:
    
    return pertenece(l1,e) and pertenece(l2, e)

def elementos_exclusivos(s: list[int], t: list[int]) -> list[int]:
    listaFinal: list[int] = []
    listaConcatenada = s + t

    for num in listaConcatenada:
        if not pertenece_a_ambas(s,t, num) and not pertenece(listaFinal, num):
            listaFinal.append(num)
    
    return listaFinal

print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1], [0,100,5,0,100,-1,5])) # [3,4,5] combinacion
print(elementos_exclusivos([-1,4,0,4,3,0,100,0,-1,-1], [0,5,0,-1,5])) # [3,4,5, 100] combinacion
print(elementos_exclusivos([2,1,1,8,1,1,9], [1,1,10,1,12,1,1])) # [2,8,9,10,12] combinacion
print()
print("Aqui termina el Ej 2")
print()

# Ejercicio 3
#
# Se cuenta con un diccionario que contiene traducciones de palabras del idioma castellano (claves) a palabras
# en inglés (valores), y otro diccionario que contiene traducciones de palabras en castellano (claves) a palabras
# en alemán (valores). Se pide escribir un programa que dados estos dos diccionarios devuelva la cantidad de 
# palabras que tienen la misma traducción en inglés y en alemán.

#  problema contar_traducciones_iguales (ing: dicc⟨String,String⟩, ale: dicc⟨String,String⟩) : Z {
#    requiere: -
#    asegura: {res = cantidad de palabras que están en ambos diccionarios y además tienen igual valor en ambos}
#  }

#  Por ejemplo, dados los diccionarios
#    aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
#    inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}


aleman = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
inglés = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand"}

aleman1 = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht"}
inglés1 = {"Pie": "Foot"}

aleman2 = {"Mano": "Hand", "Pie": "Fuss", "Dedo": "Finger", "Cara": "Gesicht", "Veneno": "Gift"}    # aprendi aleman en la escuela
inglés2 = {"Pie": "Foot", "Dedo": "Finger", "Mano": "Hand", "Regalo": "Gift"}

def contar_traducciones_iguales( ing: dict, ale: dict) -> int:
    cantidad: int = 0
    clavesAlemanas: list[str] = ale.keys()
    clavesInglesas: list[str] = ing.keys()

    for palabra in clavesInglesas:
        if palabra in clavesAlemanas:
            if ing[palabra] == ale[palabra]:
                cantidad += 1 


    return cantidad

print(contar_traducciones_iguales(inglés, aleman)) # 2
print(contar_traducciones_iguales(inglés1, aleman1)) # 0
print(contar_traducciones_iguales(aleman, inglés)) # 2
print(contar_traducciones_iguales(inglés2, aleman2)) # 2
print()
print("Aqui termina el Ej 3")
print()


# Ejercicio 4
#
# Dada una lista de enteros s, se desea devolver un diccionario cuyas claves sean los valores presentes en s, 
# y sus valores la cantidad de veces que cada uno de esos números aparece en s

#  problema convertir_a_diccionario (lista: seq⟨Z⟩) : dicc⟨Z,Z⟩) {
#    requiere: -
#    asegura: {res tiene como claves los elementos de lista y res[n] = cantidad de veces que aparece n en lista}
#  }

#  Por ejemplo, dada la lista
#  lista = [-1,0,4,100,100,-1,-1]

def convertir_a_diccionario(lista: list[int]) -> dict:
    dicccionario: dict = {}

    for num in lista:
        if num in dicccionario:
            dicccionario[num] += 1
        else:
            dicccionario[num] = 1

    return dicccionario

print(convertir_a_diccionario([-1,0,4,100,100,-1,-1])) # dict= {-1 : 3 , 0 : 1 , 4 : 1 , 100 : 2}
