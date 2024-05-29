#Ej 1
#I)

def contar_lineas(archivo: str) -> int:
    file = open(archivo, "r")
    lineas: list[str]  = file.readlines()
    return(len(lineas))

#II)

def existe_palabra(palabra: str, nombre_archivo: str) -> bool:
    file = open(nombre_archivo, "r")

    res:bool = False

    for linea in file.readlines():
        todasLasPalabras: list[str] = linea.split() 
        
        if palabra in todasLasPalabras:
            res = True
            break

    file.close()
    return res

print(existe_palabra("felipe", "archivo.txt"))

#III)

def apariciones(archivo: str , word: str) -> int:
    file = open(archivo, "r")
    i:int = 0

    for lineas in file.readlines():
        todasLasPalabras: list [str] = lineas.split()

        for linea in todasLasPalabras:
            if linea.strip() == word:
                i += 1

    file.close()
    return i

print(apariciones("archivo.txt", "boca"))
