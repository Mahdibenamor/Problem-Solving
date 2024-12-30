import 'dart:math';

class Solution {
  int rob(List<int> nums) {
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

    return dp.values.reduce(max);
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

  print(solution.rob([
    114,
    117,
    207,
    117,
    235,
    82,
    90,
    67,
    143,
    146,
    53,
    108,
    200,
    91,
    80,
    223,
    58,
    170,
    110,
    236,
    81,
    90,
    222,
    160,
    165,
    195,
    187,
    199,
    114,
    235,
    197,
    187,
    69,
    129,
    64,
    214,
    228,
    78,
    188,
    67,
    205,
    94,
    205,
    169,
    241,
    202,
    144,
    240
  ]));
}
