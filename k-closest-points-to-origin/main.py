
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
        
class Solution(object):
    def kClosest(self, points, k):
        """
        :type points: List[List[int]]
        :type k: int
        :rtype: List[List[int]]
        """
        self.points = points
        self.k = k
        minHeap = []
        for point in points:
            minHeap.append([point[0] **2 + point[1] **2, point[0], point[1] ])
        heapq.heapify(minHeap)
        res = []
        while k > 0: 
            point = heapq.heappop(minHeap)
            res.append([point[1], point[2]])
            k = k -1
        return res    


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
    
            