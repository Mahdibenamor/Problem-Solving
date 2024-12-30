import 'dart:math';

class Solution {
  int minCostClimbingStairs(List<int> cost) {
    Map<int, double> dp = Map();
    int n = cost.length;
    double dfs(int step) {
      if (step > n) {
        return double.infinity;
      }
      if (step == n) {
        return 0;
      }
      if (dp.containsKey(step)) {
        return dp[step]!;
      }
      double stepResult = cost[step] + min(dfs(step + 1), dfs(step + 2));
      dp[step] = stepResult;
      return stepResult;
    }

    dfs(0);
    return min(dp[0]!, dp[1]!).toInt();
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

  print(solution.minCostClimbingStairs([1, 100, 1, 1, 1, 100, 1, 1, 100, 1]));
}
