class Solution {
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
  print(solution.subsets([1, 2]));
}
