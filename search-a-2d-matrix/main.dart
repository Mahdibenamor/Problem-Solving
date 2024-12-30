class Solution {
  bool searchMatrix(List<List<int>> matrix, int target) {
    int findRowRec(int start, int end) {
      int n = matrix[0].length;
      if (start > end) {
        return -1;
      }
      if (target >= matrix[start][0] && target <= matrix[start][n - 1])
        return start;
      if (target >= matrix[end][0] && target <= matrix[end][n - 1]) return end;
      int middle = (start + end) ~/ 2;
      if (target >= matrix[middle][0] && target <= matrix[middle][n - 1])
        return middle;

      if (matrix[middle][n - 1] < target) {
        return findRowRec(middle, end - 1);
      } else {
        return findRowRec(start + 1, middle);
      }
    }

    bool searchRec(int start, int end, int rowIndex) {
      if (start > end) {
        return false;
      }
      if (matrix[rowIndex][start] == target) return true;

      if (matrix[rowIndex][end] == target) return true;
      int middle = (start + end) ~/ 2;
      if (matrix[rowIndex][middle] == target) {
        return true;
      }
      if (matrix[rowIndex][middle] < target) {
        return searchRec(middle, end - 1, rowIndex);
      } else {
        return searchRec(start + 1, middle, rowIndex);
      }
    }

    int rowIndex = findRowRec(0, matrix.length - 1);
    if (rowIndex == -1) {
      return false;
    } else {
      return searchRec(0, matrix[rowIndex].length - 1, rowIndex);
    }
  }
}

main() {
  Solution solution = new Solution();
  print(solution.searchMatrix([
    [1, 3, 5, 7],
    [10, 11, 16, 20],
    [23, 30, 34, 60]
  ], 10));
}
