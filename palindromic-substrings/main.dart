class Solution {
  int countSubstrings(String s) {
    int solution = 0;
    String str = s;
    int start, end = -1;
    for (int i = 0; i < str.length; i++) {
      start = end = i;
      while (start >= 0 && end <= str.length - 1) {
        if (str[start] != str[end]) {
          break;
        } else {
          solution++;
        }
        start--;
        end++;
      }
    }

    for (int i = 0; i < str.length - 1; i++) {
      start = i;
      end = i + 1;
      while (start >= 0 && end <= str.length - 1) {
        if (str[start] != str[end]) {
          break;
        } else {
          solution++;
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
  print(solution.countSubstrings("aaa"));
}
