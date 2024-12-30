import 'dart:math';

class Solution {
  int coinChange(List<int> coins, int amount) {
    Map<int, double> dp = Map();
    dp[0] = 0;
    for (int a = 1; a <= amount; a++) {
      double localResult = double.infinity;
      for (int c in coins) {
        if (a - c >= 0) {
          double prev = dp[a - c]!;
          localResult = min(localResult, 1 + prev);
        }
      }
      dp[a] = localResult;
    }
    return dp[amount] == double.infinity ? -1 : dp[amount]!.toInt();
  }
}

void main() {
  Solution solution = Solution();
  print(solution
      .coinChange([176, 6, 366, 357, 484, 226, 1, 104, 160, 331], 5557));
}
