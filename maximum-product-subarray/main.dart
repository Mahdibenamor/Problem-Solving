import 'dart:math';

class Solution {
  int maxProduct(List<int> nums) {
    int currMax = 1;
    int currMin = 1;
    int result = nums.reduce(max);
    for (int num in nums) {
      if (num == 0) {
        currMax = 1;
        currMin = 1;
      }
      int temp = currMax;
      currMax = max(max(num, num * currMax), num * currMin);
      currMin = min(min(num, num * temp), num * currMin);
      result = max(result, currMax);
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.maxProduct([-2, 3, -4]));
}
