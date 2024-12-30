import 'dart:collection';

class Solution {
  bool isValid(String s) {
    Map<String, String> dic = {')': '(', '}': '{', ']': '['};
    String currentChar = '';
    Queue<String> queue = Queue();

    for (int i = 0; i < s.length; i++) {
      currentChar = s[i];
      if (queue.isNotEmpty) {
        if (dic.containsKey(currentChar) && dic[currentChar] == queue.last) {
          queue.removeLast();
        } else {
          queue.addLast(currentChar);
        }
      } else {
        queue.addLast(currentChar);
      }
    }
    return queue.isEmpty;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.isValid("({[)"));
}
