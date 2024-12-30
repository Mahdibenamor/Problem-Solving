from collections import deque
import heapq
from typing import List


class Solution:
    def networkDelayTime(self, times: List[List[int]], n: int, k: int) -> int:
        priority_queue = []
        distances = {}
        neigbors = {}
        weight = {}
                    
        for time in times:
            weight[(time[0],time[1])] = time[2]
            if time[0] in neigbors: 
                 neigbors[time[0]].add(time[1])
            else :
                neigbors[time[0]] = set([time[1]])
        for node in range(1, n+1):
             if node == k : 
                priority_queue.append((0, node))
                distances[k] = 0; 
             else:     
                priority_queue.append((float('inf') ,node))
                distances[node] = float('inf'); 
    
        heapq.heapify(priority_queue)
        while priority_queue: 
            # if the node to check already checked and better weight, we just move on
            currentDistance, currentNode = heapq.heappop(priority_queue)
            if(currentDistance > distances[currentNode]): 
                continue

            # check the neigbors of that node: 
            if(neigbors.get(currentNode)):
                for neighor_node in neigbors.get(currentNode):
                    neighor_weight = weight[(currentNode, neighor_node)]
                    distance = currentDistance + neighor_weight
                    if(distances[neighor_node] > distance): 
                        distances[neighor_node] = distance
                        heapq.heappush(priority_queue, (distance, neighor_node))

        res = float('-inf')
        for distance in distances.values(): 
            if(distance == float('inf')):
                return -1
            else:
                if(distance> res): 
                    res = distance
        return res;            
                
                
sol = Solution()
print(sol.networkDelayTime([[2,1,1],[2,3,1],[3,4,1]], 4,2))
                

