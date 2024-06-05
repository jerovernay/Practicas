def rt(x: int, g: int) -> int:
    g = g + 1
    return x + g


g: int = 0

def ro(x: int) -> int:
    global g
    g = g + 1
    return x + g

print(rt(1, 0))
print(ro(1))