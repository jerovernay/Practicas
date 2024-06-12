#Ej 1

def esPrimo(n: int) -> bool:
    i: int = 2
    divisores: int = 0

    while i < n:
        if  (n % i == 0):
            divisores += 1
        i += 1

    if divisores == 0:
        return True
    else:
        return False

codigos =["002", "003", "004", "005", "006", "007", "008", "009", "011", "013", "017", "023", "001", "000", "101", "102"]

def filtrar_codigos_primos(codigos_barra: list)-> list[int]:
    listaFinal: list[int] = []

    for primo in codigos_barra:
        if esPrimo(int()) and primo != '001' and primo != '000':
            listaFinal.append(primo)
    
    return listaFinal

#print(filtrar_codigos_primos(codigos))

#Ej 2

stock_cambios = [("agua", 15),("comida", 25),("agua", 20),("agua", 25), ("agua", 13),("comida", 24),("comida", 26),("comida", 27),("curitas", 5),("curitas", 2),("curitas", 9)]

def stock_productos(stock_cambios: list[(str, int)]) -> dict[str,(int, int)]:
    res = {}

    for producto, stock in stock_cambios:
        if producto in res:
            minimo, maximo = res[producto]

            if stock < minimo:
                minimo = stock
            elif stock > maximo:
                maximo = stock
            res[producto] = (minimo, maximo)

        else:
            res[producto] = (stock, stock)

        
    return res

#print(stock_productos(stock_cambios))


#Ej 3

def un_responsable_por_turno(grilla_horaria: list[list[str]]) -> list[(bool, bool)]:
    responsables: list[(bool, bool)] = []
    num_filas = len(grilla_horaria) #8 
    num_columnas = len(grilla_horaria[0]) # solo miras la primera

    for columna in range(num_columnas):
                                    # Unica puta forma de hacerlo (creo, obvio), estoy re caliente
        contadorAM = {}             # la idea es ir metiendo a ver si el fracasado que decidio laburar ahi cumplio el turno de mierda
        contadorPM = {}             # es decir, se crea clave como el chabon y valor las veces que el chabon aparece en la fila

        for fila in range(num_filas // 2):
            fracasado = grilla_horaria[fila][columna]

            if fracasado in contadorAM:
                contadorAM[fracasado] += 1
            else:
                contadorAM[fracasado] = 1

        for fila in range(num_filas // 2 , num_filas):
            estupido = grilla_horaria[fila][columna]

            if estupido in contadorPM:
                contadorPM[estupido] += 1
            else:
                contadorPM[estupido] = 1

        
        cumplioAM = False
        for fraca, veces in contadorAM.items():
            if veces == 4:
                cumplioAM = True
                break

        cumplioFM = False
        for estupi, veces in contadorPM.items():
            if veces == 4:
                cumplioFM = True
                break

        responsables.append((cumplioAM, cumplioFM))

    return responsables



grilla0 = [                                  #laburantes perfectos
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"]
]



grilla1 = [                              # distinto sea (3 True y 4 False , todo True)
["p","p","p","p","s","p","s"],
["p","s","p","p","s","p","p"],
["p","p","s","p","s","p","p"],
["p","p","p","s","s","p","p"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"],
["o","o","o","o","o","o","o"]
]


grilla2 = [          #miti miti
["p","p","p","e","e","e","e"],
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["o","o","o","o","o","o","o"],
["o","o","o","e","o","o","o"],
["o","o","o","o","o","o","o"],
["o","o","o","o","e","e","e"]
]


grilla3 = [  #todo mal
["p","p","p","p","p","p","p"],
["p","p","p","p","p","p","p"],
["p","j","p","p","p","p","p"],
["z","p","o","f","f","f","f"],
["t","s","o","o","o","o","o"],
["o","o","e","o","o","o","o"],
["o","o","o","f","f","f","f"],
["o","o","o","o","o","o","o"]
]

print(un_responsable_por_turno(grilla0))
print(un_responsable_por_turno(grilla1))
print(un_responsable_por_turno(grilla2))
print(un_responsable_por_turno(grilla3))


#Ej 4

def subsecuencias_mas_larga(s: list[int]) -> int:

    res = [0,0]

    cant = 0
    indice = 0

    i = 0
    while i < len(s):
        if s[i] == "perro" or s[i] == "gato" :
            indice = i - cant
            cant+=1
            if cant > res[0]:
                res = [cant, indice]
        else:
            cant= 0
            indice = 0
        i+=1

    return res[1]


veterinaria = ["perro", "gato", "perro", "ave", "perro", "gato", "gato", "gato", "tucan", "gato", "gato"]
""" 
def subsecuencia_mas_larga(tipos_pacientes_atendidos: list[str]) -> int:
    secuencia: int = 0
    subsecuencia: int = 0


    for animal in tipos_pacientes_atendidos:
        if animal == "gato" or animal == "perro":
            secuencia += 1

        elif animal != "gato" or animal != "perro":
            if subsecuencia < secuencia:
                subsecuencia = secuencia
            secuencia = 0

    return subsecuencia
"""

print(subsecuencias_mas_larga(veterinaria)) #4 

