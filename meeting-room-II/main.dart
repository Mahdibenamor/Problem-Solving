import 'dart:math';

class Solution {
  int minMeetingRooms(List<List<int>> intervals) {
    List<int> points = [];
    List<int> starts = [];
    List<int> ends = [];
    for (var interval in intervals) {
      starts.add(interval.first);
      points.add(interval.first);
      ends.add(interval.last);
      points.add(interval.last);
    }

    // sort intervals in the good number

    points.sort();
    starts.sort();
    ends.sort();

    int count = 0;
    int res = count;
    while (!(points.isEmpty)) {
      int curretPoint = points.removeAt(0);
      if (ends.isNotEmpty && curretPoint == ends.first) {
        ends.removeAt(0);
        count--;
      } else {
        starts.removeAt(0);
        count++;
      }
      res = max(res, count);
    }
    return res;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.minMeetingRooms([
    [1, 5],
    [5, 10],
    [10, 15],
    [15, 20]
  ]));
}
