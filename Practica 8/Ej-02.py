def comentarioInicial(palabra:str):
    if palabra[0] == "#":
        return True
    return False

def comentariosFiltrado(Clon: list) -> list:
    for palabras in Clon:
        if comentarioInicial(palabras):
            Clon.remove(palabras)

    return Clon



def clonar_sin_comentarios(nombre_archivo: str):
    archivo = open(nombre_archivo, "r")
    res = open("Archivo_Clon.txt", "w", "utf8")
    texto: list [str] = archivo.readlines
        
    for linea in texto:
        Clon: list[str] = linea.split()
        listaClonada = comentariosFiltrado(Clon)
        linea = " ".join(listaClonada)
        res.write(linea + '\n')

    archivo.close()
    return res 

clonar_sin_comentarios("archivo.txt")
archivoClon = open("Archivo_Clon.txt", "r")
contenido = archivoClon.read()
print(contenido)
