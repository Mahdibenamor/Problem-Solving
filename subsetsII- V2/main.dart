class Solution {
  List<List<int>> result = List.empty(growable: true);
  List<List<int>> subsetsWithDup(List<int> nums) {
    nums.sort((a, b) => a.compareTo(b));
    dfs(nums, [], 0);
    return result;
  }

  dfs(List<int> inputs, List<int> branch, int index) {
    if (index == inputs.length) {
      result.add([...branch]);
      return;
    }
    int firstIndexOf = index + 1;
    int lastIndexOf = inputs.lastIndexOf(inputs[index]) + 1;

    List<int> currentBranch = [...branch];
    currentBranch.add(inputs[index]);
    dfs(inputs, [...currentBranch], firstIndexOf);
    dfs(inputs, [...branch], lastIndexOf);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.subsetsWithDup([1, 2, 2, 3]));
}
