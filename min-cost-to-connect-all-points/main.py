from collections import deque
import heapq
from typing import List


class Solution:
    def minCostConnectPoints(self, points: List[List[int]]) -> int:
        priority_heap = []
        visited = set()
        wieghts = {}
        cost = 0
        for i in range(len(points)):
            wieghts[i] = points[i]

        priority_heap.append((0,0))
        heapq.heapify(priority_heap)
        while priority_heap and len(visited) != len(points): 
            distance, node = heapq.heappop(priority_heap)
            if(node not in visited):
                cost = cost + distance
                visited.add(node)
                for neigbor in range(len(points)):
                    if(neigbor != node and neigbor not in visited):
                        current_distance = abs(wieghts[node][0] - wieghts[neigbor][0]) + abs(wieghts[node][1] - wieghts[neigbor][1])
                        heapq.heappush(priority_heap, (current_distance, neigbor))
        return cost
    
        
                
sol = Solution()
print(sol.minCostConnectPoints([[0,0],[2,2],[3,10],[5,2],[7,0]]))
                

