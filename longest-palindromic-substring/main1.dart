class Solution {
  String longestPalindrome(String s) {
    String solution = "";
    for (int i = 0; i < s.length; i++) {
      int start = i;
      int end = i;
      while (end < s.length && start >= 0) {
        if (s[start] != s[end]) {
          break;
        } else {
          String sub = s.substring(start, end + 1);
          if (sub.length > solution.length) {
            solution = sub;
          }
        }
        start--;
        end++;
      }
    }
    for (int i = 0; i < s.length - 1; i++) {
      int start = i;
      int end = i + 1;
      while (end < s.length && start >= 0) {
        if (s[start] != s[end]) {
          break;
        } else {
          String sub = s.substring(start, end + 1);
          if (sub.length > solution.length) {
            solution = sub;
          }
        }
        start--;
        end++;
      }
    }

    return solution;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.longestPalindrome("cbbd"));
}
