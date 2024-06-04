def splitRead(texto, limites: str =(' ', '\n', ',', '.', '!', '?')):
    """
    Esta función toma una cadena `text` y la divide en una lista de cadenas utilizando
    los caracteres en `delimiters` como separadores. En Texto, se busca lo dado por file.read()
    """
    lista = []
    word = ''

    for char in texto:
        if char not in limites:
            word += char
        else:
            if word:
                lista.append(word)
                word = ''
    if word:  # Para añadir la última palabra si no termina en delimitador
        lista.append(word)
    return lista

# Ejemplo de uso
file= open('hoy.txt', 'r')
contenido = file.read()
lineas = file.readlines()


# Dividir el contenido usando la función split personalizada
palabras = splitRead(contenido)
print(palabras)    


def splitReadlines(texto, limites: str =(' ', '\n', ',', '.', '!', '?')):
    """
    Esta función toma una lista de líneas `lines` y la divide en una lista de cadenas
    utilizando los caracteres en `delimiters` como separadores.
    """
    lista = []

    for line in lines:
        word = ''
        for char in line:
            if char not in limites:
                word += char
            else:
                if word:
                    lista.append(word)
                    word = ''
        if word:  # Para añadir la última palabra de la línea si no termina en delimitador
            lista.append(word)
    return lista


# Ejemplo de uso
file = open('hoy.txt', 'r')
lines = file.readlines()


# Dividir el contenido usando la función split_lines personalizada
palabras2 = splitReadlines(lines)
print(palabras2)
