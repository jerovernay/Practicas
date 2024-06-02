def agrupar_por_longitud(nombreArchivo : str) -> dict:
    diccionario = dict()
    file = open(nombreArchivo, "r")
    contenido = file.read()
    palabras = contenido.split()

    for palabra in palabras:
        longitud = len(palabra)

        if longitud in diccionario:
            diccionario[longitud] += 1
        else:
            diccionario[longitud] = 1

    file.close()

    return diccionario

print(agrupar_por_longitud("hoy.txt"))