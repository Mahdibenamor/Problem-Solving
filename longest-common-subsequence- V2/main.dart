import 'dart:math';

class Solution {
  int longestCommonSubsequence(String text1, String text2) {
    return max(LCS(text1, text2), LCS(text2, text1));
    //return LCS(text1, text2);
  }

  int LCS(String text1, String text2) {
    int p1 = 0;
    int p2 = 0;
    int result = 0;
    while (text2.isNotEmpty) {
      while (p1 < text1.length && p2 < text2.length) {
        if (text1[p1] == text2[p2]) {
          p2++;
        }
        p1++;
      }
      result = max(result, p2);
      text2 = text2.substring(1);
      p2 = 0;
      p1 = 0;
    }

    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.LCS("vozsh", "psnw"));
}
