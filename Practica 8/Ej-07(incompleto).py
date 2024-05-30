def promedioEstudiante(nombreArchivo: str, lu:str) -> float:
    file = open("notas.csv")
    boletin = file.read()
    notas = boletin.split()
    suma = 0
