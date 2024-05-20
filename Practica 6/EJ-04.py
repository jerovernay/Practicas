#Ejercicio 4

""" En una plantación de pinos, de cada árbol se conoce la altura expresada en metros. El peso de un pino se puede estimar
a partir de la altura de la siguiente manera:
3 kg por cada centímetro hasta 3 metros,
2 kg por cada centímetro arriba de los 3 metros.
Por ejemplo:
2 metros pesan 600 kg, porque 200 * 3 = 600
5 metros pesan 1300 kg, porque los primeros 3 metros pesan 900 kg y los siguientes 2 pesan los 400 restantes.
Los pinos se usan para llevarlos a una fábrica de muebles, a la que le sirven árboles de entre 400 y 1000 kilos, un pino
fuera de este rango no le sirve a la fábrica.
Definir las siguientes funciones, deducir qué parámetros tendrán a partir del enunciado. Se pueden usar funciones auxiliares
si fuese necesario para aumentar la legibilidad.
1. Definir la función peso_pino
2. Definir la función es_peso_util, recibe un peso en kg y responde si un pino de ese peso le sirve a la fábrica.
3. Definir la función sirve_pino, recibe la altura de un pino y responde si un pino de ese peso le sirve a la fábrica.
4. Definir sirve_pino usando composición de funciones """

def peso_pino(alt: float) -> int:
    res: int = (min(alt, 300) * 3) + ((max(alt,300) - 300) * 2)
    return res

def peso_util(peso : float) -> bool:
    res: bool = (peso >= 400) and (peso <= 1000)
    return res
     
def sirve_pino(alt: float) -> bool:
    if peso_util(alt) == True:
        return True
    else:
        return False

alt: float = float(input("los cm del arbol son "))
print(sirve_pino(peso_pino(alt)))
