from collections import deque
import heapq
from typing import List

class Solution:
    def findRedundantConnection(self, edges: List[List[int]]) -> List[int]:
        n = 0
        parent= []
        rank = []

        for start, end in edges: 
            if start > n : 
                n= start 
            if end > n : 
                n = end;
        for i in range(n +1):
            rank.append(1)
            parent.append(i)
        
        def find(n):
            p = parent[n] 
            while(p != parent[p]):
                p = parent[p]
            return p;
        def union(n1, n2): 
            p1, p2 = find(n1), find(n2)
            if p1 == p2: 
                return False
            else: 
                rank1, rank2 = rank[n1], rank[n2]
                if rank1 >= rank2: 
                    rank1 = rank1 + rank2
                    parent[p2] = p1
                else: 
                    rank2 = rank2 + rank1
                    parent[p1] = p2  
                return True
        for start, end in edges:
            if(not union(start, end)): 
                 return [start, end]


sol = Solution()
print(sol.findRedundantConnection([[1,4],[3,4],[1,3],[1,2],[4,5]]))


