def masAparece(diccionario : dict) -> str:
    max: int = 0 
    res: str = "Palabra que aparece mas veces"
    claves = diccionario.keys()

    for clave in claves:
        if diccionario[clave] > max:
            max = diccionario[clave]             
            res = clave

    return res 

def la_palabra_mas_frecuente(nombreArchivo : str) -> str:
    diccionario: dict = {}
    file = open(nombreArchivo, "r")
    contenido: str = file.read()
    palabras: list[str] = contenido.split()

    for palabra in palabras:
        if palabra in diccionario:
            diccionario[palabra] += 1
        else:
            diccionario[palabra] = 1

    res: str = masAparece(diccionario)
    file.close()

    return res
    
print(la_palabra_mas_frecuente("hoy.txt")) #me