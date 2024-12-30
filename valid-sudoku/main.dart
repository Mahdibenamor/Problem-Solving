class Solution {
  bool isValidSudoku(List<List<String>> board) {
    int n = board.length;
    List<(int, int)> moves = [
      (0, 0),
      (0, 1),
      (0, -1),
      (1, 0),
      (1, 1),
      (1, -1),
      (-1, 0),
      (-1, 1),
      (-1, -1),
    ];
    for (int i = 0; i < n; i++) {
      Set<String> nums = Set();
      for (int j = 0; j < n; j++) {
        if (board[i][j] != '.' && nums.contains(board[i][j])) {
          return false;
        } else {
          nums.add(board[i][j]);
        }
      }
      nums = Set();
      for (int j = 0; j < n; j++) {
        if (board[j][i] != '.' && nums.contains(board[j][i])) {
          return false;
        } else {
          nums.add(board[j][i]);
        }
      }
    }

    for (int i in [1, 4, 7]) {
      for (int j in [1, 4, 7]) {
        Set<String> nums = Set();
        for (var move in moves) {
          (int, int) pos = (i + move.$1, j + move.$2);
          if (board[pos.$1][pos.$2] != '.' &&
              nums.contains(board[pos.$1][pos.$2])) {
            return false;
          } else {
            nums.add(board[pos.$1][pos.$2]);
          }
        }
      }
    }
    return true;
  }

  void countingSort(List<int> array, int maxValue) {
    List<int> count = List.filled(maxValue + 1, 0);

    for (int num in array) {
      count[num]++;
    }

    int index = 0;
    for (int num = 0; num <= maxValue; num++) {
      while (count[num] > 0) {
        array[index++] = num;
        count[num]--;
      }
    }
  }

  List<int> sortArray(List<int> arr) {
    if (arr.isEmpty) return arr;

    int maxValue = arr.reduce((a, b) => a > b ? a : b);

    countingSort(arr, maxValue);
    return arr;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.isValidSudoku([
    [".", ".", ".", ".", "5", ".", ".", "1", "."],
    [".", "4", ".", "3", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "3", ".", ".", "1"],
    ["8", ".", ".", ".", ".", ".", ".", "2", "."],
    [".", ".", "2", ".", "7", ".", ".", ".", "."],
    [".", "1", "5", ".", ".", ".", ".", ".", "."],
    [".", ".", ".", ".", ".", "2", ".", ".", "."],
    [".", "2", ".", "9", ".", ".", ".", ".", "."],
    [".", ".", "4", ".", ".", ".", ".", ".", "."]
  ]));
}
