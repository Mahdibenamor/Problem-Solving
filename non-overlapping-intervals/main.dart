import 'dart:math';

class Solution {
  int eraseOverlapIntervals(List<List<int>> intervals) {
    intervals.sort((a, b) => a.first.compareTo(b.first));
    int res = 0;
    int previousEnd = intervals.first.last;
    for (int i = 1; i < intervals.length; i++) {
      List<int> interval = intervals[i];
      int sencondBegin = interval.first;
      if (sencondBegin >= previousEnd) {
        previousEnd = interval.last;
      } else {
        previousEnd = min(previousEnd, interval.last);
        res++;
      }
    }
    return res;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.eraseOverlapIntervals([
    [1, 2],
    [2, 3],
    [3, 4],
    [1, 3]
  ]));
}
