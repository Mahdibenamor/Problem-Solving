import 'dart:math';

class Solution {
  Map<(int, int), int> dp = Map();
  int lengthOfLongestSubstring(String s) {
    int l = 0;
    int r = 0;
    int len = 0;
    Set<String> addedChars = Set();
    while (r < s.length) {
      String currentChar = s[r];
      while (addedChars.contains(currentChar)) {
        addedChars.remove(s[l]);
        l++;
      }
      addedChars.add(currentChar);
      len = max(len, r - l + 1);
      r++;
    }
    return len;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.lengthOfLongestSubstring("abcabcbb"));
}
