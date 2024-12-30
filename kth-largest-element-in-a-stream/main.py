
import heapq


class KthLargest(object):
    
    def __init__(self, k, nums):
        """
        :type k: int
        :type nums: List[int]
        """
        self.k = k
        self.minHeap = nums
        heapq.heapify(self.minHeap)
        while len(self.minHeap) > k:
            heapq.heappop(self.minHeap)
        

    def add(self, val):
        """
        :type val: int
        :rtype: int
        """
        heapq.heappush(self.minHeap,val)
        if len(self.minHeap) > self.k:
            heapq.heappop(self.minHeap)
        return self.minHeap[0]    

kthLargest = KthLargest(3, [4, 5, 8, 2])
print(kthLargest.add(3))    # return 4
print(kthLargest.add(5))    # return 5
print(kthLargest.add(10))   # return 5
print(kthLargest.add(9))    # return 8
print(kthLargest.add(4))    # return 8
        

class Solution(object):
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
    
            