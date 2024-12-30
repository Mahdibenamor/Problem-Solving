import 'dart:collection';

class Solution {
  Set<(int, int)> visitedLands = Set();
  int maxSurface = 0;

  int maxAreaOfIsland(List<List<int>> grid) {
    int rows = grid.length;
    int cols = grid[0].length;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1 && !visitedLands.contains((r, c))) {
          BFS(r, c, grid);
        }
      }
    }
    return maxSurface;
  }

  BFS(int r, int c, List<List<int>> grid) {
    int surface = 1;
    int rows = grid.length;
    int cols = grid[0].length;
    Queue<(int, int)> queue = Queue();
    queue.addFirst((r, c));
    visitedLands.add((r, c));
    List<(int, int)> possibleMoves = [(1, 0), (-1, 0), (0, 1), (0, -1)];
    while (queue.isNotEmpty) {
      (int, int) currentLand = queue.removeLast();
      for (var move in possibleMoves) {
        (int, int) nextLand =
            (currentLand.$1 + move.$1, currentLand.$2 + move.$2);
        if (nextLand.$1 >= 0 &&
            nextLand.$1 < rows &&
            nextLand.$2 >= 0 &&
            nextLand.$2 < cols &&
            !visitedLands.contains((nextLand.$1, nextLand.$2)) &&
            grid[nextLand.$1][nextLand.$2] == 1) {
          visitedLands.add(nextLand);
          queue.add(nextLand);
          surface++;
        }
      }
    }
    if (surface > maxSurface) {
      maxSurface = surface;
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.maxAreaOfIsland([
    [0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
    [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0]
  ]));
}
