class Solution {
  List<List<int>> result = List.empty(growable: true);
  List<List<int>> combinationSum2(List<int> nums, int target) {
    nums.sort((a, b) => a.compareTo(b));
    dfs(nums, [], 0, target);
    return result;
  }

  dfs(List<int> inputs, List<int> branch, int index, int target) {
    if (target == 0) {
      result.add([...branch]);
      return;
    }
    if (target < 0) {
      return;
    }
    if (index == inputs.length) {
      return;
    }
    List<int> currentBranch = [...branch];
    currentBranch.add(inputs[index]);
    dfs(inputs, [...currentBranch], index + 1, target - inputs[index]);
    int lastIndex = inputs.lastIndexOf(inputs[index]);
    dfs(inputs, [...branch], lastIndex + 1, target);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.combinationSum2([10, 1, 2, 7, 6, 1, 5], 8));
}
