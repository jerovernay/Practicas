from queue import LifoQueue as Pila 

def numero_valido(elem: str) -> bool:
    
    if elem == '':
        return False
    elif elem == '-':
        return False
    elif elem[0] == '-':
        elem = elem[1:]

    es_decimal = False

    for elem2 in elem:
        if elem2 == '.':
            if es_decimal:
             return False
            es_decimal = True
        elif not ("0" <= elem2 <= "9"):
            return False
    
    return True



def evaluar_expresion(s : str) -> float:
    p = Pila()
    tokens = s.split()

    for elem in tokens:
        if numero_valido(elem):
            p.put(float(elem))
        else:
            operador2 = p.get()     #importante que sea el segundo operador el que se saca, ya que al ser el primero en salir queremos que sea sumado por el que le sigue tal que (3 4 +) sea 3 + 4 y no 4 + 3, ya que a primera vista puede no variar pero marca la diferencia en el menos. 
            operador1 = p.get()

            if elem == '+':
                res = operador1 + operador2
            elif elem == '-':
                res = operador1 - operador2
            elif elem == '*':
                res = operador1 * operador2
            elif elem == '/':
                res = operador1 // operador2
            
            p.put(res)

    return p.get()

expresion = "3 4 + 5 * 2 -"
expresion1 = "4 5 * 3 +"
expresion2 = "7 7 / 5 * 10 +"

resultado = evaluar_expresion("3 4 + 5 * 2 -")
resultado1 = evaluar_expresion("4 5 * 3 +")
resultado2= evaluar_expresion("7 7 / 5 * 10 +")

print(resultado) #33
print(resultado1) #23
print(resultado2) #15

