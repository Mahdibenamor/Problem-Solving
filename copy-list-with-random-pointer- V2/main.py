
class Node:
    def __init__(self, x, next=None, random=None):
        self.val = int(x)
        self.next = next
        self.random = random

class Solution(object):


    def copyRandomList(self, head):
        node_map = {}
        node_map_random = {}

        if(not head): 
            return None
        index = head
        while(index):
            node_map[index] = Node(index.val)
            node_map_random[index] = index.random
            index = index.next
        index = head
        while(index): 
            copiedNode = node_map[index]
            if(index.next):
                copiedNode.next = node_map[index.next]
            else: 
                copiedNode.next = None

            randomIndex = node_map_random[index]
            if(not randomIndex):
                copiedNode.random = None
            else:    
                copiedNode.random = node_map[randomIndex]    
            node_map[index] = copiedNode
            index = index.next
        copied = node_map[head]
        return copied    

            


                  
    


      
node3 = Node(3);
node2 = Node(2,node3);       
node1 = Node(1, node2);
node2.random = node1
s = Solution();

print(s.copyRandomList(node1))
