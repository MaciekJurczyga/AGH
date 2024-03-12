import numpy as np

filepath = "C:/Users/macie/Downloads/packages/packages 20/packages20.txt"
f = open(filepath, 'r')
items = f.read()
items = items.splitlines()

item = [item.split(",") for item in items[2:]]


def get_item_info(i):
    item_id = item[i][0]
    item_width = item[i][1]
    item_height = item[i][2]
    item_value = item[i][3]
    return item_id, item_width, item_height, item_value
for i in range(len(item)):
    item_info = get_item_info(i)
    item_id = item_info[0]
    item_width = item_info[1]
    item_heigth = item_info[2]
    item_value = item_info[3]

    value_to_size = int((item_value))/(int((item_width))*(int(item_heigth)))
    item[i].append(str(value_to_size))


item.sort(key=lambda x: int(x[4]), reverse=True)


def creating_backpack(capacity):
    backpack = np.zeros((capacity, capacity))
    return backpack


capacity = 20
backpack = creating_backpack(capacity)


def add_items():
    total_value = 0
    for i in range(len(item)):
        item_info = get_item_info(i)
        item_id = int(item_info[0])
        item_width = int(item_info[1])
        item_height = int(item_info[2])
        item_value = int(item_info[3])
        for w in range(capacity - item_width + 1):
            for h in range(capacity - item_height + 1):
                if np.all(backpack[w:w + item_width, h:h + item_height] == 0):
                    backpack[w:w + item_width, h:h + item_height] = item_id
                    total_value += item_value
                    break
            else:
                continue
            break
    print(total_value)
    return backpack


add_items()