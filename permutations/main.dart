class Solution {
  List<List<int>> permute(List<int> nums) {
    List<List<int>> result = List.empty(growable: true);
    result = doPermute(nums);
    return result;
  }

  List<List<int>> doPermute(List<int> inputs) {
    List<List<int>> result = List.empty(growable: true);
    if (inputs.length == 1) {
      return [inputs];
    }

    for (int i = 0; i < inputs.length; i++) {
      int pivot = inputs[i];
      List<int> localInputs = [...inputs];
      localInputs.removeAt(i);
      List<List<int>> pivotResults = doPermute(localInputs);
      for (var child in pivotResults) {
        child.add(pivot);
        result.add(child);
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.permute([1, 2, 3]));
}
