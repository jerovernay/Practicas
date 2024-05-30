from queue import LifoQueue as Pila 

def esta_bien_balanceada(s : str) -> bool:
    p = Pila()

    for letra in s:
        if letra == '(':
            p.put(letra)
        elif letra == ')':
            if (p.empty() or (p.get() != '(')):
                return False
    return True

print(esta_bien_balanceada("1 + ( 2 x 3 - ( 2 0 / 5 ) )")) # True
print(esta_bien_balanceada("10 * ( 1 + ( 2 * ( -1)))")) # True
print(esta_bien_balanceada("1 + ) 2 x 3 ( ( )")) # False
