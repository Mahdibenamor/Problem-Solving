import 'dart:math';

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    intervals.sort((a, b) => a.first.compareTo(b.first));
    print(intervals);
    List<List<int>> solution = [intervals[0]];
    for (int i = 1; i < intervals.length; i++) {
      List<int> lastIterval = solution.last;
      List<int> intervalToAdd = intervals[i];
      if (lastIterval.last >= intervalToAdd.first) {
        lastIterval = [
          lastIterval.first,
          max(intervalToAdd.last, lastIterval.last)
        ];
        solution[solution.length - 1] = lastIterval;
      } else {
        solution.add(intervalToAdd);
      }
    }
    return solution;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.merge([
    [4, 5],
    [2, 4],
    [1, 10]
  ]));
}
