import numpy as np

def convert_file_to_matrix(file_path):
    with open(file_path, 'r') as file:
        file = file.read()
    rows = file.split('\n')[:-1]
    size = int(len(rows))
    matrix = np.zeros((size, size), dtype = object)

    for i in range(size):
        for j in range(size):
            matrix[i][j] = rows[i][j]
    return matrix

def native(matrix, pattern):
    m = len(matrix)
    p = len(pattern)
    cords = []
    for i in range(m-p+1):
        for j in range(m-p+1):
            if pattern[0] == matrix[i][j] and pattern[1] == matrix[i][j+1] and pattern[2] == matrix[i][j+2]:
                if pattern[1] == matrix[i+1][j] and pattern[2] == matrix[i+2][j]:
                    cords.append((i,j))
    return cords
file_path_1 = "C:/Users/macie/Downloads/patterns/patterns/1000_pattern.txt"
matrix = convert_file_to_matrix(file_path_1)
ex1_answer = native(matrix, pattern='ABC')
print(ex1_answer)

def KarpRabin(matrix, pattern):
    m = len(matrix)
    p = len(pattern)
    cords = []
    base = 20
    occurances = 0
    patternHash = 0

    for index, letter in enumerate(pattern):
        patternHash += (ord(letter)*((base)**(p-1-index)))
    for i in range(m-p+1):
        line = matrix[i]
        for j in range(m-p+1):
            lineHash = 0
            for k in range(p):
                lineHash += (ord(line[j+k]))*((base)**(p-1-k))
            if lineHash == patternHash:
                if pattern[0] == line[j] and pattern[1] == line[j+1] and pattern[2] == line[j+2]:
                    column = [matrix[i+k][j] for k in range(p)]
                    columnHash = 0
                    for z in range(p):
                        columnHash += (ord(column[z]))*((base)**(p-1-z))
                    if columnHash == patternHash:
                            cords.append((i,j))
                            occurances += 1
    return cords, occurances

pattern = 'ABC'
ex2_answer = KarpRabin(matrix, pattern)
print(f"coordinates of found pattern: {ex2_answer[0]}, number of occurances: {ex2_answer[1]}")






