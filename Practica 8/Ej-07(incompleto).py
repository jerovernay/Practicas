def splitRead(text):

    limites: str = ('.', ',', '\n', ' ', '?', '!')
    lista = []
    word = ''

    for char in text:
        if char not in limites:
            word += char
        else:
            if word:
                lista.append(word)
                word = ''

    if word:
        lista.append(word)
    return lista



""" def promedioEstudiante(nombreArchivo: str, lu:str) -> float:
    file = open(nombreArchivo)
    boletin = file.read()
    notas = splitRead(boletin)
    suma: float = 0
    
    for nota in notas: """