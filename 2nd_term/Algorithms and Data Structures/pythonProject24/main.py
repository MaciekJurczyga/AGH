class Node:
    def __init__(self, value):
        self.value = value
        self.left = None
        self.right = None


class NodeList:
    def __init__(self):
        self.list = []


class BinaryTree:
    def __init__(self):
        self.nodeList = NodeList()

    def insertNode(self, value):
        for i in self.nodeList.list:
            if i.value == value:
                break
            elif i.value > value:
                self.nodeList.list.insert(__index=i, __object=Node(value))
            else:
                self.nodeList.list.append(Node(value))

    def insertValue(self, value):
        currentNode = None
        for i in self.nodeList.list:
            if abs(i.value-value) <= 0.5 and i.value!=value:
                if abs((i+1).value - value) <= 0.5 and (i+1)<len(self.nodeList.list):
                    currentNode = self.nodeList.list[i+1]
                    break
                else:
                    currentNode = self.nodeList.list[i]
                    break
        self.insertInside(self, currentNode,  value)

    def insertInside(self, node, value):
        if value > node.value:
            if node.right is None:
                node.right = Node(value)
            else:
                self.insertInside(self, node.right, value)
        elif value < node.value:
            if node.left is None:
                node.right = Node(value)
            else:
                self.insertInside(self, node.right, value)




