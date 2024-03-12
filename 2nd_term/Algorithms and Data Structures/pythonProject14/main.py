


def pierwiastek(x):
    if(x==0):
        return 0.0
    if(type(x)!=float and type(x)!=int):
        return "Brak"
    for i in range(2,int(x)):
        if((x/i)==i):
            return float(i)
    return "Brak"
print(pierwiastek('abc'))
 