import 'dart:math';

class Solution {
  int rob(List<int> nums) {
    int rob1 = 0;
    int rob2 = 0;
    for (var num in nums) {
      int temp = rob2;
      rob2 = max(num + rob1, rob2);
      rob1 = temp;
    }
    return rob2;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.rob([2, 7, 9, 3, 1]));
}
