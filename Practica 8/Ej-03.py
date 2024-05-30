def obtener_lineas(nombreArchivo: str) -> list[str]:
    archivo = open(nombreArchivo)
    lineas = archivo.readlines()
    archivo.close()
    return lineas

def reverso(nombreArchivo: str):
    lineas = obtener_lineas(nombreArchivo)
    listaInvertida: list [str] = []

    for i in range(len(lineas)):

        listaInvertida.append(lineas[len(lineas) -1 -i])        
    
    reverso = open("Reverso.txt", "w")
    reverso.writelines(listaInvertida )
    reverso.close()

reverso("hoy.txt")