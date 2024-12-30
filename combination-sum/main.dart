class Solution {
  List<List<int>> result = List.empty(growable: true);
  void dfs(List<int> branch, List<int> candidates, int target, int index) {
    List<int> currentBranch = [...branch];

    if (index > candidates.length - 1) {
      return;
    }
    if (target == 0) {
      result.add([...currentBranch]);
    }
    if (target < 0) {
      return;
    }
    if (target > 0) {
      List<int> branchToSend = [...branch];
      branchToSend.add(candidates[index]);
      dfs(branchToSend, candidates, target - candidates[index], index);
      dfs(currentBranch, candidates, target, index + 1);
    }
  }

  List<List<int>> combinationSum(List<int> candidates, int target) {
    dfs([], candidates, target, 0);
    return result;
  }
}

main() {
  Solution solution = Solution();
  print(solution.combinationSum([2, 3, 6, 7], 7));
}
