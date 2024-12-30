from collections import deque
import heapq
from typing import List

class Solution:
    def swimInWater(self, grid: List[List[int]]) -> int:
        n = len(grid)
        distances = {}
        priority_heap = []
        for i in range(n): 
            for j in range(n):
                distances[(i , j)] = float('inf');
        distances[(0, 0)] = grid[0][0]
        visited_nodes = set()
        visited_nodes.add((0,0))
        priority_heap.append((grid[0][0], 0,0, visited_nodes.copy()))
        heapq.heapify(priority_heap)
        moves = [(0,1), (0, -1), (1, 0), (-1, 0)]
        while priority_heap : 
            distance, x, y, current_visited = heapq.heappop(priority_heap)
            if distance > distances[(x, y)] : 
                continue; 

            for xmove, ymove in moves: 
                neigborx, neigbory = x + xmove, y + ymove
                if neigborx >= 0 and neigborx <n and neigbory >= 0 and neigbory < n :
                    if (neigborx, neigbory) not in current_visited:
                        visited = current_visited.copy()
                        current_distnce = max(distance,grid[x][y], grid[neigborx][neigbory])
                        if(current_distnce < distances[(neigborx,neigbory)]):
                            distances[(neigborx,neigbory)] = current_distnce
                            visited.add((neigborx,neigbory))
                            heapq.heappush(priority_heap,(current_distnce, neigborx, neigbory, visited.copy()))
        return distances[(n -1, n -1)];

        


sol = Solution()
print(sol.swimInWater([[3,0],[2,1]]))


