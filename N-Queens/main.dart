class Solution {
  List<List<List<String>>> solution = List.empty(growable: true);
  List<List<String>> solveNQueens(int n) {
    List<List<String>> map = List.empty(growable: true);
    for (int i = 0; i < n; i++) {
      map.add(List.filled(n, "E"));
    }
    dfs(map, n, 0);
    return [];
  }

  dfs(List<List<String>> board, int n, int currentIndex) {
    if (currentIndex == n) {
      print(board);
      return;
    }
    if (currentIndex % 2 != 0) {
      for (int i = 0; i < n; i++) {
        List<List<String>> map = [...board];
        if (map[currentIndex][i] == ".") {
          continue;
        }
        if (i % 2 != 0 && map[currentIndex][i] != ".") {
          map[currentIndex][i] = ".";
        }
        if (i % 2 == 0 && map[currentIndex][i] != ".") {
          map[currentIndex][i] = "Q";
          for (int j = currentIndex + 1; j < n; j++) {
            map[j][i] = ".";
          }
          dfs([...map], n, currentIndex + 1);
        }
      }
    }
    if (currentIndex % 2 == 0) {
      for (int i = 0; i < n; i++) {
        List<List<String>> map = [...board];
        if (map[currentIndex][i] == ".") {
          continue;
        }
        if (i % 2 == 0 && map[currentIndex][i] != ".") {
          map[currentIndex][i] = ".";
        }
        if (i % 2 != 0 && map[currentIndex][i] != ".") {
          map[currentIndex][i] = "Q";
          for (int j = currentIndex + 1; j < n; j++) {
            map[j][i] = ".";
          }
          dfs([...map], n, currentIndex + 1);
        }
      }
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.solveNQueens(4));
  //print(solution.isPalandrom("aa"));
}
