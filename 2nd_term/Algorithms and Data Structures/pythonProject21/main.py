import numpy as np
filepath = "C:/Users/macie/Downloads/packages/packages 20/packages20.txt"
f = open(filepath, 'r')

items = f.read()
items = items.splitlines()

item = [item.split(",") for item in items[2:]]
def get_item_info(i):
    item_id = item[i][0]
    item_width = item[i][1]
    item_heigth = item[i][2]
    item_value = item[i][3]
    return item_id, item_width, item_heigth, item_value
for i in range(len(item)):
    item_info = get_item_info(i)
    item_id = item_info[0]
    item_width = item_info[1]
    item_heigth = item_info[2]
    item_value = item_info[3]


    value_to_size = int((item_value))/(int((item_width))*(int(item_heigth)))
    item[i].append(str(value_to_size))

item.sort(key=lambda x: x[4], reverse=True)


def creating_backpack(capacity):
    backpack = np.zeros((capacity,capacity))
    return backpack

def add_items( capacity):
    backpack = np.zeros((capacity, capacity))
    total_value = 0
    capacity = 20
    for i in range(len(item)):
        bool = False
        print(i)
        item_info = get_item_info(i)
        item_id = int(item_info[0])
        item_width = int(item_info[1])
        item_heigth = int(item_info[2])
        item_value = int(item_info[3])
        #print(item_info)
        if not bool:
            for w in range(int(capacity)-int(item_width)+1):
                if w + item_width > capacity+1 :
                    break
                for h in range(capacity-item_heigth+1):
                   if h + item_heigth > capacity+1 :
                       break
                   if np.all(backpack[w:(w+item_width), h:(h+item_heigth)] == 0):
                       backpack[w:(w+item_width), h:(h+item_heigth)] = item_id
                       total_value += item_value
                       bool = True
                       break
                if bool:
                    break

        if not bool:
            item_heigth, item_width = item_width, item_heigth
            for w in range((capacity) - (item_width+1)):
                if w + item_width > (capacity+1):
                    break
                for h in range((capacity) - (item_heigth+1)):
                    if h + item_heigth > capacity+1 :
                        break
                    if np.all(backpack[w : (w + item_width), h:(h + item_heigth)] == 0):
                        backpack[w:(w + item_width), h:(h + item_heigth)] = item_id
                        total_value += item_value
                        bool = True
                        break
                if bool:
                    break
    return backpack, total_value,




capacity = 20
#backpack = creating_backpack(capacity)
backpack, value = add_items(capacity)

def print_backpack(backpack):
    print()
    for line in backpack:
        print()
        for element in line:
            lenght = len(str(element))
            print(int(element), end=(3-lenght)*" "+" ")
            if len(str(element)) == 3:
                print(" ", end="")

print_backpack(backpack)
print(value)







