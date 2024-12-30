
class ListNode(object):
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution(object):
    # def hasCycle1(self, head):
    #     visitedNode = set([])
    #     def dfs(head):
    #         if(not head): 
    #             return False
    #         if(head in visitedNode):
    #             return True;
    #         else:
    #             visitedNode.add(head)
    #             return dfs(head.next)
    #     return dfs(head)

    def hasCycle(self, head):
        slow, fast = head, head
        while fast and fast.next: 
            slow = slow.next
            fast = fast.next.next
            if slow == fast: 
                return True
            
        return False    
    
            