import 'dart:math';

class Solution {
  List<List<int>> insert(List<List<int>> intervals, List<int> newInterval) {
    List<List<int>> solution = [];
    bool keepCoping = false;
    for (List<int> interval in intervals) {
      if (keepCoping) {
        solution.add(interval);
      } else {
        if (newInterval.last < interval.first) {
          solution.add(newInterval);
          solution.add(interval);
          keepCoping = true;
        } else if (newInterval.first > interval.last) {
          solution.add(interval);
        } else {
          newInterval = [
            min(newInterval.first, interval.first),
            max(newInterval.last, interval.last)
          ];
        }
      }
    }
    if (!keepCoping && newInterval.length == 2) {
      solution.add(newInterval);
    }

    return solution;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.insert([
    [1, 2],
    [3, 5],
    [6, 7],
    [8, 10],
    [12, 16]
  ], [
    4,
    8
  ]));
}
