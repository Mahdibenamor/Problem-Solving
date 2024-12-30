from collections import deque
import heapq
from typing import List

# class Solution:
#     def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int:
#         weights = {}
#         priority_heap = []
#         neigbors = {}
#         neigbors.setdefault(set)
#         for flight in  flights:
#             weights[(flight[0],flight[1])] = flight[2]
#             if not neigbors.get(flight[0]):
#                 neigbors[flight[0]] = set()
#             neigbors[flight[0]].add(flight[1])


#         priority_heap.append((0,-1, src))
#         heapq.heapify(priority_heap)
#         result = float('inf')
#         while priority_heap:
#             current_cost, current_stops_count, current_node = heapq.heappop(priority_heap)
#             if current_node == dst:
#                 if current_stops_count <= k and cost < result :
#                         result = current_cost
#             if current_stops_count > k:
#                 continue
#             # if  current_cost > distances[current_node][0]  :
#             #     continue

#             if(neigbors.get(current_node)):
#                 for neigbor in neigbors.get(current_node):
#                     weigh = weights[current_node, neigbor]
#                     cost = weigh + current_cost
#                     if(current_stops_count + 1 <= k):
#                             heapq.heappush(priority_heap,(cost, current_stops_count + 1, neigbor))
#         return  -1 if result == float('inf') else result;

class Solution:
    def findCheapestPrice(self, n: int, flights: List[List[int]], src: int, dst: int, k: int) -> int: 
        weights = {}
        distances = {} 
        priority_heap = []
        neigbors = {}
        neigbors.setdefault(set)
        for flight in  flights: 
            weights[(flight[0],flight[1])] = flight[2]
            if not neigbors.get(flight[0]):
                neigbors[flight[0]] = set()
            neigbors[flight[0]].add(flight[1])

        # [0] is the cost , [1] is the stops count
        for node in range(0,n +1): 
            distances[(node, -1)] = float('inf') 
        distances[(src,-1)] = 0 
        priority_heap.append((0,-1, src))
        heapq.heapify(priority_heap)
        result = float('inf')

        while priority_heap: 
            current_cost, current_stops_count, current_node = heapq.heappop(priority_heap)
            if current_node == dst:
                if current_stops_count <= k and cost < result :
                        result = current_cost
 
            if current_stops_count > k: 
                continue

            if(neigbors.get(current_node)): 
                for neigbor in neigbors.get(current_node):
                    weigh = weights[current_node, neigbor]
                    cost = weigh + current_cost
                    if (neigbor, current_stops_count) not in distances or distances[neigbor, current_stops_count] > cost: 
                        distances[(neigbor,current_stops_count)] = cost
                        heapq.heappush(priority_heap,(cost, current_stops_count + 1, neigbor))
        return  -1 if result == float('inf') else result; 


sol = Solution()


