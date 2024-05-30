def obtener_lineas(nombreArchivo: str) -> list[str]:
    archivo = open(nombreArchivo)
    lineas = archivo.readlines()
    archivo.close()
    return lineas

def escribir_lineas(nombreArchivo: str , listaDeLineas: list[str]):
    archivo = open(nombreArchivo, "w")
    archivo.writelines(listaDeLineas)
    archivo.close()


def agregar_frase_alPrincipio(nombreArchivo : str, frase : str):
    lineas = obtener_lineas(nombreArchivo)
    frase += '\n'
    masLineaDelPrincipio = [frase]
    
    for i in range(len(lineas)):
        masLineaDelPrincipio.append(lineas[i])

    escribir_lineas(nombreArchivo, masLineaDelPrincipio)
    

agregar_frase_alPrincipio("hoy.txt", "Hello")