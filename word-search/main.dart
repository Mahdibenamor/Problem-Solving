class Solution {
  bool hasSolution = false;
  bool exist(List<List<String>> board, String word) {
    List<(int, int, String)> entryPoints = List.empty(growable: true);
    for (int i = 0; i < board.length; i++) {
      for (int j = 0; j < board[i].length; j++) {
        if (board[i][j] == word[0]) {
          entryPoints.add((i, j, word[0]));
        }
      }
    }
    for (int i = 0; i < entryPoints.length; i++) {
      if (!hasSolution) {
        List<(int, int, String)> visistedElements = List.empty(growable: true);
        visistedElements.add(entryPoints[i]);
        dfs(board, word, 1, visistedElements, true, true, true, true);
        if (hasSolution) {
          break;
        }
      }
    }
    return hasSolution;
  }

  dfs(
      List<List<String>> board,
      String word,
      int index,
      List<(int, int, String)> visistedElements,
      bool canUP,
      bool canDown,
      bool canLeft,
      bool canRight) {
    int m = board.length;
    int n = board.first.length;
    if (hasSolution) {
      return;
    }
    if (visistedElements.length == word.length) {
      hasSolution = true;
      return;
    }
    (int, int, String) currentPosition = visistedElements.last;
    String nextELement = word[index];

    if (canRight && currentPosition.$2 < n - 1) {
      String rightElement = board[currentPosition.$1][currentPosition.$2 + 1];
      if (rightElement == nextELement &&
          !visistedElements.contains(
              (currentPosition.$1, currentPosition.$2 + 1, nextELement))) {
        visistedElements
            .add((currentPosition.$1, currentPosition.$2 + 1, nextELement));
        dfs(board, word, index + 1, [...visistedElements], true, true, false,
            true);
        visistedElements.removeLast();
      }
    }

    if (canLeft &&
        currentPosition.$2 > 0 &&
        !visistedElements.contains(
            (currentPosition.$1, currentPosition.$2 - 1, nextELement))) {
      String leftElement = board[currentPosition.$1][currentPosition.$2 - 1];
      if (leftElement == nextELement) {
        visistedElements
            .add((currentPosition.$1, currentPosition.$2 - 1, nextELement));
        dfs(board, word, index + 1, [...visistedElements], true, true, true,
            false);
        visistedElements.removeLast();
      }
    }

    if (canUP && currentPosition.$1 > 0) {
      String upElement = board[currentPosition.$1 - 1][currentPosition.$2];
      if (upElement == nextELement &&
          !visistedElements.contains(
              (currentPosition.$1 - 1, currentPosition.$2, nextELement))) {
        visistedElements
            .add((currentPosition.$1 - 1, currentPosition.$2, nextELement));
        dfs(board, word, index + 1, [...visistedElements], true, false, true,
            true);
        visistedElements.removeLast();
      }
    }

    if (canDown && currentPosition.$1 < m - 1) {
      String downElement = board[currentPosition.$1 + 1][currentPosition.$2];
      if (downElement == nextELement &&
          !visistedElements.contains(
              (currentPosition.$1 + 1, currentPosition.$2, nextELement))) {
        visistedElements
            .add((currentPosition.$1 + 1, currentPosition.$2, nextELement));
        dfs(board, word, index + 1, [...visistedElements], false, true, true,
            true);
        visistedElements.removeLast();
      }
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.exist([
    ["A", "B", "C", "E"],
    ["S", "F", "E", "S"],
    ["A", "D", "E", "E"]
  ], "ABCESEEEFS"));
}
