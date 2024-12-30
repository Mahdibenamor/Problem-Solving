class Solution {
  List<List<String>> solve(List<List<String>> board) {
    int rows = board.length;
    int cols = board.first.length;

    void dfs(int r, int c) {
      if (r < 0 || r >= rows || c < 0 || c >= cols) {
        return;
      }
      if (board[r][c] != "O") {
        return;
      }
      board[r][c] = "T";
      dfs(r + 1, c);
      dfs(r - 1, c);
      dfs(r, c + 1);
      dfs(r, c - 1);
    }

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if ((r == 0 || r == rows - 1 || c == 0 || c == cols - 1) &&
            board[r][c] == "O") {
          dfs(r, c);
        }
      }
    }

    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        if (board[r][c] == "O") {
          board[r][c] = "X";
        }
        if (board[r][c] == "T") {
          board[r][c] = "O";
        }
      }
    }

    return board;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.solve([
    ["X", "X", "X", "X"],
    ["X", "O", "O", "X"],
    ["X", "X", "O", "X"],
    ["X", "O", "X", "X"]
  ]));
}
