
import heapq

class Solution(object):
    def lastStoneWeight(self, stones):
        """
        :type stones: List[int]
        :rtype: int
        """
        maxHeap = []
        for stone in stones: 
            maxHeap.append(-stone)
        heapq.heapify(maxHeap)

        while len(maxHeap) > 1:
            stone1 = -heapq.heappop(maxHeap)
            stone2 = -heapq.heappop(maxHeap)
            if(stone1 != stone2): 
                diff = abs(stone1 - stone2)
                stone2 = heapq.heappush(maxHeap, -diff)
        if len(maxHeap)== 0:
            return 0;   
        else :
            return -maxHeap[0]



            
        

class Solution1(object):
    def kthSmallest(self, root, k):
        minHeap = []

        def dfs(node):
            if not node:
                return
            minHeap.append(node.val)
            dfs(node.left)
            dfs(node.right)
            
        dfs(root)
        print(minHeap)
        heapq.heapify(minHeap)
        res = None
        while k > 0:
            res = heapq.heappop(minHeap)
            k -= 1

        return res
    
            