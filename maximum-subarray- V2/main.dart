import 'dart:collection';
import 'dart:math';

class Step {
  final int index;
  final int jumps;
  Step({required this.index, required this.jumps});
}

class Solution {
  int maxSubArray(List<int> nums) {
    int maxSum = nums[0];
    int currentSum = 0;
    for (int i = 0; i < nums.length; i++) {
      if (currentSum < 0) {
        currentSum = 0;
      }
      currentSum = currentSum + nums[i];
      if (currentSum > maxSum) {
        maxSum = currentSum;
      }
    }
    return maxSum;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.maxSubArray([5, 4, -1, 7, 8]));
}
