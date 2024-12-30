from collections import defaultdict
import heapq
from typing import List


class groupAnagrams: 
    def groupAnagrams(self, strs: List[str]) -> List[List[str]]: 
        res = defaultdict(list)
        for str in strs: 
            code = [0] * 26

            for c in str: 
                code[ord(c) - ord("a")] = code[ord(c) - ord("a")] +1
            res[tuple(code)].append(str)    
        return res.values()
    


class Solution: 
    def topKFrequent(self, nums: List[int], k: int) -> List[int]: 
        new  = "azer"
        new = ''.join(reversed(new))
        return new     

so = Solution()
so.topKFrequent([1,1,100,2,5,3], 2)                 
                
        