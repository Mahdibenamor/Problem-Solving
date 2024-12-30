import 'dart:math';

class Solution {
  int characterReplacement(String s, int k) {
    int len = 0;
    Map<String, int> letterCounter = Map();
    int left = 0;
    int right = 0;

    while (right < s.length) {
      if (letterCounter.containsKey(s[right])) {
        letterCounter[s[right]] = letterCounter[s[right]]! + 1;
      } else {
        letterCounter[s[right]] = 1;
      }
      int windowsLenght = (right - left + 1);
      if (windowsLenght - getMaxLetterCount(letterCounter) <= k) {
        len = max(len, windowsLenght);
      } else {
        letterCounter[s[left]] = letterCounter[s[left]]! - 1;
        left++;
      }
      right++;
    }
    return len;
  }

  int getMaxLetterCount(Map<String, int> letterCounter) {
    if (letterCounter.isEmpty) {
      return 0;
    }
    return letterCounter.values.reduce(max);
  }
}

main() {
  Solution solution = new Solution();
  print(solution.characterReplacement("AABABBA", 1));
}
