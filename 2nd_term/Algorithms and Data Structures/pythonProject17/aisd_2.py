import time


def move(n, source, dest):
    #print("disk", n , "from", source, "to", dest )
    return 0
def hanoi(n, source, dest, buff):
    if (n==1):
        move(n, source, dest)
        return 1
    else:
        moves = 0
        moves += int(hanoi(n-1, source, buff, dest))
        move(n, source, dest)
        moves += 1
        moves += int(hanoi(n-1, buff, dest, source))
    return moves



def hanoi2(n, sour, dest, buff):
    i=1
    if n%2 == 0:
        buff, dest = dest, buff
    sour_val = []
    dest_val = []
    buff_val = []
    for a in range(n):
        sour_val.append(n-a)
    while(n % 2 == 0 and (sour_val or dest_val)) or (sour_val and dest_val):
        if i % 3 == 1:
            if not dest_val or (sour_val and dest_val and min(dest_val) > min(sour_val)):
                #print("move disk ", min(sour_val), "from", sour, "to", dest)
                dest_val.append(min(sour_val))
                sour_val.pop()
            else:
               # print("move disk ", min(dest_val), "from", dest, "to", sour)
                sour_val.append(min(dest_val))
                dest_val.pop()
        if i % 3 == 2:
            if not buff_val or (sour_val and buff_val and min(buff_val) > min(sour_val)):
               # print("move disk ", min(sour_val), "from", sour, "to", buff)
                buff_val.append(min(sour_val))
                sour_val.pop()
            else:
               # print("move disk ", min(buff_val), "from", buff, "to", sour)
                sour_val.append(min(buff_val))
                buff_val.pop()
        if i % 3 == 0:
            if not dest_val or (buff_val and dest_val and min(dest_val) > min(buff_val)):
               # print("move disk ", min(buff_val), "from", buff, "to", dest)
                dest_val.append(min(buff_val))
                buff_val.pop()
            else:
               # print("move disk ", min(dest_val), "from", dest, "to", buff)
                buff_val.append(min(dest_val))
                dest_val.pop()
        i += 1
    return i-1

def main():
    n = int(input("disks: "))
    stime = time.time()
    hanoi(n,1,2,3)
    RecursionTime = time.time() - stime
    stime2 = time.time()
    hanoi2(n,1,2,3)
    IterativeTime = time.time() - stime2
    print("rekurecnja czas: ", RecursionTime)
    print("iteracja czas: ", IterativeTime)

main()