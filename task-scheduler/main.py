
import heapq
from multiprocessing import heap
from typing import List
from pyparsing import deque

class Solution(object):
    def leastInterval(self, tasks: List[str], n: int) -> int:
        """
        :type tasks: List[str]
        :type n: int
        :rtype: int
        """
        taskExecution = {}
        for task in tasks: 
            if taskExecution.get(task) == None: 
                taskExecution[task] = 1
            else :
                taskExecution[task]= taskExecution[task] +1
   
        maxHeap = [];         
        q = deque()
    
        for taskName in taskExecution.keys():
           maxHeap.append(-taskExecution[taskName])
        time = 0
        heapq.heapify(maxHeap)  
        while(not (len(maxHeap) == 0 and len(q) == 0)): 
            time += 1 
            if(len(maxHeap) > 0): 
                task_poul = heapq.heappop(maxHeap)
                task_poul += 1
                if(task_poul != 0): 
                    q.append([task_poul,time + n])
            if(len(q)>0) and q[0][1] == time:
                task = q.popleft()
                heapq.heappush(maxHeap,task[0])
        return time        

        
solution = Solution()
solution.leastInterval(["A","A","A","B","B","B"], 2 )



    
            

