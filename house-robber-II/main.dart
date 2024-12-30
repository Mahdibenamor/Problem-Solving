import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    print(nums.sublist(0, nums.length - 1));
    print(nums.sublist(1, nums.length));
    return max(
        nums[0],
        max(robStreet(nums.sublist(0, nums.length - 1)),
            robStreet(nums.sublist(1, nums.length))));
  }

  int robStreet(List<int> nums) {
    Map<int, int> dp = Map();
    int result = 0;
    int dfs(int position, int sum) {
      int localMax = nums[position];
      sum = sum + nums[position];
      result = max(result, sum);
      for (int i = position + 2; i < nums.length; i++) {
        int childMax = 0;
        if (dp.containsKey(i)) {
          childMax = dp[i]!;
        } else {
          childMax = dfs(i, sum);
        }
        localMax = max(localMax, childMax + nums[position]);
      }
      dp[position] = localMax;
      return localMax;
    }

    for (int i = 0; i < nums.length; i++) {
      dfs(i, 0);
    }

    return dp.values.length != 0 ? dp.values.reduce(max) : 0;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.robStreet([]));
}
