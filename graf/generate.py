from random import random, choice

data = open("ctverce.dat", "w+")
squares = open("ctverce2.dat", "w+")


def f(x):
    return x/2


for x in range(0, 15, 2):
    y = f(x)+(random()+0.5)*choice([1, -1])
    data.write(f"{x}\t{y}\n")
    delta = y-f(x)
    print(y, f(x), delta)
    squares.write(
        f"set object {x+1} rect from {x},{f(x)} to {x+abs(delta)},{y}\n")
