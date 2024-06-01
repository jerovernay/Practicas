from queue import Queue as Cola

#Defino la tupla para poder crear las auxiliares de prioridad y preferencial
#Sea la tupla definida como: 
#("Nombre y Apellido", DNI, preferencial(si o no), Edad, Prioidad)

def imprimir_Cola(c):
    while not c.empty():
        elem: int = c.get()
        print(elem)

""" ingreso = Cola()
ingreso.put(("Javier Baez", 31567324, "NO", "Ninguna"))
ingreso.put(("Manuel Rey", 21436789, "NO", 66))
ingreso.put(("Sofia Gonzalez", 48567123, "SI", "Ninguna"))
ingreso.put(("Evan Perez", 41357468, "NO", 21, "Ninguna"))
ingreso.put(("Martha Gutierrez", 15678901, "NO", "Discapacidad"))
ingreso.put(("Lourdes Zskanov", 25678912, "SI", "Embarazada" )) """
                                                                # Es necesario?
""" def es_Prioridad(edad: int , prioridad: str) -> bool:
    res: bool = False

    if edad >= 65:
        res = True
    elif (prioridad == "Embarazada") or (prioridad == "Discapacitada"):
            res = True

    return res

def es_Preferencial(preferencial: str) -> bool:
    res: bool = False

    if preferencial == "SI":
        res = True

    return res """

ingreso = Cola()
ingreso.put(("Javier Baez", 31567324, False, False )) #5
ingreso.put(("Manuel Rey", 21436789, False , True)) #2
ingreso.put(("Sofia Gonzalez", 48567123, True, False)) #4
ingreso.put(("Evan Perez", 41357468, False, False)) #6
ingreso.put(("Martha Gutierrez", 15678901, False, True)) #3
ingreso.put(("Lourdes Zskanov", 25678912, True , True )) #1

def atencion_clientes(c : Cola[(str, int, bool, bool)]) -> Cola[(str, int, bool, bool)]:
    colaPrioridad = Cola()
    colaPreferencial = Cola()
    colaRegular = Cola()
    colaDoblePrioridad = Cola()

    while not c.empty():
        cliente = c.get()
        nombre_apellido , DNI, es_preferencial, es_prioridad = cliente
        
        if es_prioridad and es_preferencial:
            colaDoblePrioridad.put(cliente)
        elif es_prioridad:
            colaPrioridad.put(cliente)
        elif es_preferencial:
            colaPreferencial.put(cliente)
        else:
            colaRegular.put(cliente)

    colaOficial = Cola()

    while not colaDoblePrioridad.empty():
        clienteDoblePrioridad = colaDoblePrioridad.get()
        colaOficial.put(clienteDoblePrioridad)

    while not colaPrioridad.empty():
        clientePrioridad = colaPrioridad.get()
        colaOficial.put(clientePrioridad)

    while not colaPreferencial.empty():
        clientePreferencial = colaPreferencial.get()
        colaOficial.put(clientePreferencial)
    
    while not colaRegular.empty():
        clienteRegular = colaRegular.get()
        colaOficial.put(clienteRegular)

    return colaOficial


atencion = atencion_clientes(ingreso)
print(imprimir_Cola(atencion))