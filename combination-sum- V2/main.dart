class Solution {
  List<List<int>> solution = List.empty(growable: true);

  List<List<int>> combinationSum(List<int> candidates, int target) {
    substract(candidates, [], target);
    return solution;
  }

  void substract(List<int> candidates, List<int> branch, int target) {
    List<int> currentBranch = [...branch];
    for (var num in candidates) {
      int newTarget = target - num;
      if (newTarget > 0) {
        currentBranch.add(num);
        substract(candidates, currentBranch, newTarget);
      } else if (newTarget == 0) {
        currentBranch.add(num);
        solution.add(currentBranch);
        return;
      } else if (newTarget < 0) {
        return;
      }
      currentBranch.removeLast();
    }
  }
}

void main() {
  Solution solution = Solution();
  print(solution.combinationSum([2, 3, 6, 7], 7));
}
