class Solution {
  int uniquePaths(int m, int n) {
    List<List<int>> dp = List.empty(growable: true);
    for (int i = 0; i < m; i++) {
      dp.add(List.filled(n, 0, growable: true));
    }
    dp[m - 1][n - 1] = 1;
    for (int i = n - 1; i >= 0; i--) {
      for (int j = m - 1; j >= 0; j--) {
        int rightSide = 0;
        int leftSide = 0;
        if (!(i == n - 1 && j == m - 1)) {
          if (i + 1 > n - 1) {
            rightSide = 0;
          } else {
            rightSide = dp[j][i + 1];
          }

          if (j + 1 > m - 1) {
            leftSide = 0;
          } else {
            leftSide = dp[j + 1][i];
          }

          dp[j][i] = rightSide + leftSide;
        }
      }
    }
    return dp[0][0];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.uniquePaths(3, 2));
}
