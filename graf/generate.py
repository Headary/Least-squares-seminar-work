from random import random, choice

data = open("ctverce.dat", "w+")
squares = open("ctverce2.dat", "w+")
interval = 1.5


def f(x):
    return -(x-6)**2/14 + (x-3)/5 + 5


for x in range(1, 13, 2):
    y = f(x)+(random()+0.5)*choice([interval, -interval])
    data.write(f"{x}\t{y}\n")
    delta = y-f(x)
    print(y, f(x), delta)
    squares.write(
        f"set object {x+1} rect from {x},{f(x)} to {x+abs(delta)},{y}\n")
