import 'dart:math';

class Solution {
  int lengthOfLIS(List<int> nums) {
    int result = 0;
    Map<int, int> dp = Map();
    int dfs(int startPosition) {
      if (dp.containsKey(startPosition)) {
        return dp[startPosition]!;
      }

      int localSolution = 1;
      int pivot = nums[startPosition];
      for (int i = startPosition + 1; i < nums.length; i++) {
        int number = nums[i];
        if (number > pivot) {
          localSolution = max(localSolution, 1 + dfs(i));
        }
      }
      dp[startPosition] = localSolution;
      return localSolution;
    }

    for (int i = 0; i < nums.length; i++) {
      result = max(result, dfs(i));
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.lengthOfLIS([0, 1, 0, 3, 2, 3]));
}
