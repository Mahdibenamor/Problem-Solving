class Solution {
  int climbStairs(int n) {
    Map<int, int> dp = Map();
    double.infinity;
    int dfs(int step) {
      if (step > n) {
        return 0;
      }
      if (step == n) {
        return 1;
      }
      if (dp.containsKey(step)) {
        return dp[step]!;
      }
      int stepResult = dfs(step + 1) + dfs(step + 2);
      dp[step] = stepResult;
      return stepResult;
    }

    return dfs(0);
  }
}

void main() {
  Solution solution = Solution();
  // print(solution.findOrder(4, [
  //   [1, 0],
  //   [2, 0],
  //   [3, 1],
  //   [3, 2]
  // ]));

  print(solution.climbStairs(5));
}
