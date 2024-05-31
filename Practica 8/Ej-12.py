from queue import LifoQueue as Pila 


def evaluar_expresion(s : str) -> float:
    p = Pila()
    

    for elem in s:
        if elem != ('+' or '-' or '*' or '/'):
            p.put(elem)
        else:
            operador1 = p.get()
            operador2 = p.get()

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