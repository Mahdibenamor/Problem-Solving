import 'package:collection/collection.dart';
import 'dart:math';

class Solution {
  List<List<int>> kClosest(List<List<int>> points, int k) {
    List<List<int>> result = List.empty(growable: true);
    PriorityQueue<List<int>> queue =
        PriorityQueue<List<int>>((a, b) => compareTo(a, b));
    for (var point in points) {
      queue.add(point);
    }
    for (int i = 0; i < k; i++) {
      result.add(queue.removeFirst());
    }
    return result;
  }

  int compareTo(List<int> a, List<int> b) {
    return (pow(a[0], 2) + pow(a[1], 2))
        .compareTo((pow(b[0], 2) + pow(b[1], 2)));
  }
}

void main() {
  Solution solution = Solution();
  print(solution.kClosest([
    [3, 3],
    [5, -1],
    [-2, 4]
  ], 2));
}
