f = open('zadanie2.csv', 'r')
print(f)
txt = f.read()

txt = txt.splitlines()
txt = [l.split(',') for l in txt]
f.close()

for line in txt:
    if line[1] == '':
        line.pop(0)
        line.pop()

txt.sort()
xd = []
xd[1:] = sorted(txt[1:], key=id)


for i in range(2, len(txt)):
    if xd[i][0] >= xd[i][0]:
        xd[i][0] = xd[i][0] + str(1)


for i in txt:
    print(i)
