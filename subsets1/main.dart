class Solution {
  List<List<int>> result = List.empty(growable: true);
  List<List<int>> subsets(List<int> nums) {
    dfs(nums, [], 0);
    return result;
  }

  dfs(List<int> inputs, List<int> branch, int index) {
    if (index == inputs.length) {
      result.add([...branch]);
      return;
    }
    List<int> currentBranch = [...branch];
    currentBranch.add(inputs[index]);
    dfs(inputs, [...branch], index + 1);
    dfs(inputs, [...currentBranch], index + 1);
  }
}

class Solution1 {
  List<List<int>> result = List.empty(growable: true);
  List<List<int>> subsets(List<int> nums) {
    result.add([]);
    doSubsets(nums, [], 0);
    return result;
  }

  doSubsets(List<int> inputs, List<int> branch, int index) {
    if (index == inputs.length) {
      return;
    }
    for (int i = index; i < inputs.length; i++) {
      List<int> currentBranch = [...branch];
      currentBranch.add(inputs[i]);
      result.add(currentBranch);
      doSubsets(inputs, currentBranch, i + 1);
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.subsets([1, 2, 3]));
}
