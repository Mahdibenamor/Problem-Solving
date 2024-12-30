
import heapq

class Solution(object):
    def findKthLargest(self, nums, k):
        """
        :type nums: List[int]
        :type k: int
        :rtype: int
        """
        negativeNumsHeap = []
        for num in nums: 
            negativeNumsHeap.append(-num)
        heapq.heapify(negativeNumsHeap)
        res = None
        while k > 0:
            res = heapq.heappop(negativeNumsHeap)
            k -= 1
        return -res    
        
        

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
    
            