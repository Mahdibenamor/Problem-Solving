import 'dart:math';

class Solution {
  int coinChange(List<int> coins, int amount) {
    Map<int, double> dp = Map();
    coins.sort();
    print(coins);
    double dfs(int amount) {
      if (amount == 0) {
        return 0;
      }
      if (dp.containsKey(amount)) {
        return dp[amount]!;
      }
      double localResult = double.infinity;
      for (int c in coins) {
        if (amount - c > 0) {
          localResult = min(localResult, 1 + dfs(amount - c));
        }
        if (amount - c == 0) {
          localResult = 1;
        }
      }
      dp[amount] = localResult;
      return localResult;
    }

    double result = dfs(amount);
    result == double.infinity ? -1 : result.toInt();
    return result == double.infinity ? -1 : result.toInt();
  }
}

void main() {
  Solution solution = Solution();
  print(solution
      .coinChange([176, 6, 366, 357, 484, 226, 1, 104, 160, 331], 5557));
}
