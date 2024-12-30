from collections import deque
import heapq
from typing import List


class Solution:
    def isNStraightHand(self, hand: List[int], groupSize: int) -> bool:
        handMap = {}
        for n in hand: 
            handMap[n] =1 + handMap.get(n, 0)
        
        
        minHeap = list(handMap.keys())
        heapq.heapify((minHeap))
        minQueue = []
        minQueue = deque()
        while  not (len(minHeap) == 0 and len(minQueue) == 0):
            while len(minQueue) != 0:
               min = minQueue.pop()
               heapq.heappush(minHeap, min)


            startGroup = minHeap[0]
            for i in range(startGroup , startGroup+groupSize):
                if(handMap.get(i , 0) == 0): 
                    return False
                
                min = heapq.heappop(minHeap)

                if(min != i ): 
                    return False
                else : 
                    handMap[i] = handMap[i] - 1
                    if(handMap.get(i , 0) != 0): 
                      minQueue.append(min)

        return True;            
                
                
sol = Solution()
print(sol.isNStraightHand([1,2,3,4,5], 4))
                


