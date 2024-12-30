from collections import defaultdict, deque
import heapq
from typing import List

class Solution:
    def ladderLength(self, beginWord: str, endWord: str, wordList: List[str]) -> int:
        if endWord not in wordList : 
            return 0
        
        def getWordPattens(word: str) -> List[str]: 
            patterns = []
            for i in range(len(word)): 
                patterns.append(word[:i] + "*" + word[i+1:])
            return patterns
        
        distance_value = {}
        neighbors = defaultdict(set)
        priority_heap = []
        for word in wordList: 
            distance_value[word] = float('inf')
            for patten in getWordPattens(word):
                 neighbors[patten].add(word)
        distance_value[beginWord] = float('inf')
        priority_heap.append((0, beginWord))
        heapq.heapify(priority_heap)
        while len(priority_heap) != 0 :
            distance, word = heapq.heappop(priority_heap)
            if distance_value[word] < distance: 
                continue
            patterns = getWordPattens(word)
            word_neighbors = set()
            for pattern in patterns: 
                for neigbor in neighbors[pattern]:  
                    word_neighbors.add(neigbor)

            for n in word_neighbors: 
                if(distance +1 < distance_value[n]): 
                    distance_value[n] = distance +1
                    heapq.heappush(priority_heap, (distance + 1 ,n))
        print(distance_value)
        return 0 if distance_value[endWord] == float('inf') else distance_value[endWord] + 1
    
     
        


sol = Solution()
print(sol.ladderLength("hit","cog", ["hot","dot","dog","lot","log","cog"]))


