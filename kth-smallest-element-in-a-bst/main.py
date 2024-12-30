
import heapq


class TreeNode:
     def __init__(self, val=0, left=None, right=None):
         self.val = val
         self.left = left
         self.right = right


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
    
            