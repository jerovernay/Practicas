from queue import LifoQueue as Pila

def imprimir_historial(historiales):
    items = historiales.items()

    for usuario, pila in items:
        print(f"Historial de {usuario}: ")
        lista = []

        while not pila.empty():
            lista.append(pila.get())
        
        for sitio in lista:
            print(sitio)

        pilaProvisional = Pila()
        while lista:
            pilaProvisional.put(lista.pop())
        while not pilaProvisional.empty():
            pila.put(pilaProvisional.get())

        print()























historiales: dict = {}

def visitar_sitio(historiales: dict[str, Pila[str]], usuario:str , sitio: str):

    if usuario not in historiales:
        historiales[usuario] = Pila()
        
    historiales[usuario].put(sitio)

def navegar_atras(historiales: dict[str, Pila[str]], usuario:str):
    
    if usuario in historiales:
        historiales[usuario].get()


visitar_sitio(historiales, "usuario1", "Twitter")
visitar_sitio(historiales, "usuario1", "Github")
visitar_sitio(historiales, "usuario1", "Moodle")
visitar_sitio(historiales, "usuario2", "Youtube")
visitar_sitio(historiales, "usuario2", "Whatsapp")
navegar_atras(historiales, "usuario1")
navegar_atras(historiales, "usuario2")
visitar_sitio(historiales, "usuario1", "Instagram") #chequeo si en realidad esta en el orden correcto dps de imprimirlo
navegar_atras(historiales, "usuario1")

imprimir_historial(historiales)