class Solution {
  Map<(int, int), int> dp = Map();
  List<int> nums = [];
  int findTargetSumWays(List<int> nums, int target) {
    this.nums = nums;
    return dfs(0, 0, target);
  }

  int dfs(int index, int currentSome, int target) {
    if (dp.containsKey((index, currentSome))) {
      return dp[(index, currentSome)]!;
    }
    int localSolution = 0;
    if (index == nums.length) {
      localSolution = currentSome == target ? 1 : 0;
    } else {
      localSolution = dfs(index + 1, currentSome + nums[index], target) +
          dfs(index + 1, currentSome - nums[index], target);
    }
    dp[(index, currentSome)] = localSolution;
    return localSolution;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.findTargetSumWays([1, 1, 1, 1, 1], 3));
}
