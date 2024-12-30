class Solution {
  bool isPalindrome(String s) {
    s = s.toLowerCase();
    s = s.replaceAll(RegExp(r'[^a-z0-9]'), '');
    int left = 0;
    int right = s.length - 1;
    while (right >= left) {
      if (s[left] != s[right]) {
        return false;
      }
      left++;
      right--;
    }
    return true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.isPalindrome("0P"));
}
