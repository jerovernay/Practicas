def obtener_lineas(nombreArchivo: str) -> list[str]:
    archivo = open(nombreArchivo)
    lineas = archivo.readlines()
    archivo.close()
    return lineas

def escribir_lineas(nombreArchivo: str , listaDeLineas: list[str]):
    archivo = open(nombreArchivo, "w")
    archivo.writelines(listaDeLineas)
    archivo.close()


def agregar_frase_alFinal (nombreArchivo : str, frase : str):
    lineas = obtener_lineas(nombreArchivo)
    lineas[-1] = lineas[-1] + '\n'
    lineas.append(frase)
    escribir_lineas(nombreArchivo, lineas)

    
agregar_frase_alFinal("hoy.txt", "Gracias")