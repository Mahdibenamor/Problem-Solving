class Solution {
  bool canAttends(List<List<int>> intervals) {
    if (intervals.length == 1) {
      return true;
    }
    // sort intervals by the start time
    // complexity nlogn
    intervals.sort((a, b) => a.first.compareTo(b.first));

    List<int> previousInterval = intervals.first;
    for (var interval in intervals) {
      if (previousInterval.last > interval.first) {
        return false;
      }
    }
    return true;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.canAttends([
    [5, 10],
    [0, 15]
  ]));
}
