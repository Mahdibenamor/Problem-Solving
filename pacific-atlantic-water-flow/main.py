from collections import defaultdict, deque
import heapq
from typing import List

class Solution:
    def pacificAtlantic(self, heights: List[List[int]]) -> List[List[int]]:
        m , n = len(heights), len(heights[0])
        result = set()
        hasAtlantic = {}
        hasPacific = {}
        
        # build the atlantic nodes:  col = n and row = m 
        for r in range(m): 
            hasAtlantic[(r, n -1)] = True
        for c in range(n): 
            hasAtlantic[(m -1, c)] = True

        # build the pacific nodes:  col = 0 and row = 0 
        for r in range(m): 
            hasPacific[(r, 0)] = True
        for c in range(n): 
            hasPacific[(0, c)] = True

        def checkVerticalAtlantic(): 
            # handle atlantic ocean:
            for c in range(n -2, -1, -1):
                for r in range(m):
                    if heights[r][c] >= heights[r][c + 1] and (r, c+1) in hasAtlantic and hasAtlantic[(r, c+1)]:
                        hasAtlantic[(r,c)] = True

       
        def checkHorizantalAtlantic(): 
            # handle atlantic ocean:
            for r in range(m -2, -1, -1):
                for c in range(n):
                    if heights[r][c] >= heights[r + 1][c ] and (r +1, c) in hasAtlantic and hasAtlantic[(r +1, c)]:
                        hasAtlantic[(r,c)] = True


        def checkPacificHorizantal():
            # handle pacific ocean horizantal:
            for r in range(m):
                for c in range(1, n):
                    if heights[r][c] >= heights[r][c -1] and (r, c-1) in hasPacific and hasPacific[(r, c-1)]:
                        hasPacific[(r,c)] = True
        
        def checkPacificVertical():
            # handle pacific ocean vertical:
            for c in range(n):
                for r in range(1,m):
                    if heights[r][c] >= heights[r - 1][c ] and (r -1, c) in hasPacific and hasPacific[(r -1, c)]:
                        hasPacific[(r,c)] = True
        
        checkVerticalAtlantic()
        checkHorizantalAtlantic()
        checkVerticalAtlantic()

        checkPacificHorizantal()
        checkPacificVertical()
        checkPacificHorizantal()

        checkHorizantalAtlantic()
        checkVerticalAtlantic()
        checkHorizantalAtlantic()

        checkPacificVertical()
        checkPacificHorizantal()
        checkPacificVertical()

        checkPacificHorizantal()
        checkPacificVertical()
        checkPacificHorizantal()

        checkVerticalAtlantic()
        checkHorizantalAtlantic()
        checkVerticalAtlantic()

        
        for r in range(m): 
            for c in range(n): 
                if (r,c) in hasAtlantic and (r,c)  in hasPacific and hasPacific[(r,c)] == True and hasAtlantic[(r,c)] == True: 
                     result.add((r,c))         
        return list(result)



sol = Solution()
print(sol.pacificAtlantic([[1,2,3],[8,9,4],[7,6,5]]))


