
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []


from typing import Optional
class Solution:
    def cloneGraph(self, node: Optional['Node']) -> Optional['Node']:
        nodes_map = {}

        def dfs(node):
            if not node:
                return None
            if node in nodes_map:
                return nodes_map[node]
            
            copy = Node(node.val)
            nodes_map[node] = copy
            
            for neighbor in node.neighbors:
                copy.neighbors.append(dfs(neighbor))
            
            return copy
        return dfs(node)
