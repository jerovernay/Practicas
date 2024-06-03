historiales: dict = {}

def visitar_sitio(historiales: dict[str, Pila[str]], usuario:str , sitio: str):

    if usuario not in historiales:
        historiales[usuario] = Pila()
    historiales[usuario].put(sitio)

def navegar_atras(historiales: dict[str, Pila[str]], usuario:str):

    for usuario, pilas in historiales.items() and not (historiales.items()).empty():
        historiales[usuario].get()


visitar_sitio(historiales, "ususario1", "twitter")
visitar_sitio(historiales, "ususario1", "github")
visitar_sitio(historiales, "ususario1", "moodle")
visitar_sitio(historiales, "ususario2", "youtube")
visitar_sitio(historiales, "ususario2", "Whatsapp")
navegar_atras(historiales, "usuario1")
navegar_atras(historiales, "usuario2")
