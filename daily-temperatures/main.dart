import 'dart:collection';

class Solution {
  List<int> dailyTemperatures(List<int> temperatures) {
    List<int> anwser = [];
    Queue<int> queueIndexs = Queue();
    for (int i = 0; i < temperatures.length; i++) {
      anwser.add(0);
    }

    for (int i = 0; i < temperatures.length; i++) {
      int n = queueIndexs.length;
      if (n > 0 && temperatures[i] > temperatures[queueIndexs.last])
        for (int j = 0; j < n; j++) {
          int queuedIndex = queueIndexs.removeLast();
          int queuedElement = temperatures[queuedIndex];
          if (temperatures[i] > queuedElement) {
            anwser[queuedIndex] = i - queuedIndex;
          } else {
            queueIndexs.addFirst(queuedIndex);
          }
        }
      queueIndexs.addLast(i);
    }

    return anwser;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73]));
}
