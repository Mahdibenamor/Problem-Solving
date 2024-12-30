class Solution {
  int orangesRotting(List<List<int>> grid) {
    int rows = grid.length;
    int cols = grid.first.length;
    int mints = 0;
    Set<(int, int)> infectionSources = Set();
    Set<(int, int)> nextInfectedSource = Set();
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 2) {
          infectionSources.add((r, c));
        }
      }
    }

    while (!(infectionSources.isEmpty && nextInfectedSource.isEmpty)) {
      while (infectionSources.isNotEmpty) {
        (int, int) infected = infectionSources.first;
        infectionSources.remove(infected);
        List<(int, int)> moves = [(1, 0), (-1, 0), (0, -1), (0, 1)];
        for (var move in moves) {
          (int, int) nextInfection =
              (infected.$1 + move.$1, infected.$2 + move.$2);
          if (nextInfection.$1 >= 0 &&
              nextInfection.$1 < rows &&
              nextInfection.$2 >= 0 &&
              nextInfection.$2 < cols &&
              grid[nextInfection.$1][nextInfection.$2] == 1) {
            grid[nextInfection.$1][nextInfection.$2] = 2;
            nextInfectedSource.add(nextInfection);
          }
        }
      }
      if (nextInfectedSource.isNotEmpty) {
        mints++;
        infectionSources = nextInfectedSource;
        nextInfectedSource = Set();
      }
    }

    int freshElement = 0;
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (grid[r][c] == 1) {
          freshElement++;
        }
      }
    }

    return freshElement != 0 ? -1 : mints;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.orangesRotting([
    [2, 1, 1],
    [0, 1, 1],
    [1, 0, 1]
  ]));
}
