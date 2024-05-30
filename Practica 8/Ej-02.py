def obtener_lineas(nombre_archivo: str) -> list[str]:
    archivo = open(nombre_archivo)
    lineas = archivo.readlines()
    archivo.close()
    return lineas

def clonar_sin_comentarios (nombre_archivo: str):
    lineas = obtener_lineas(nombre_archivo)
    lineas_sin_comentarios: list[str] = []

    for i in range(len(lineas)):
        linea = lineas[i]

        if not es_comentario(linea):
            lineas_sin_comentarios.append(linea)
    
    nuevo_archivo = open(nombre_archivo + " clonado.txt",'w') # 'w' permite crear archivo
    nuevo_archivo.writelines(lineas_sin_comentarios)
    nuevo_archivo.close()


def es_comentario (linea: str) -> bool:
    caracteres_linea = len(linea)
    
    for c in range(caracteres_linea):
            if linea[c] == ' ':
                continue # Ver el siguiente caracter
            if linea[c] == '#':
                return True
            else:
                return False
            

clonar_sin_comentarios("hoy.txt")
