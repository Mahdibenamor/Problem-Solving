// Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
// Output: 6
// Explanation: The subarray [4,-1,2,1] has the largest sum 6.


import 'dart:math';

class Solution {
  int maxSubArray(List<int> nums) {
    int maxSum = nums.first;
    int currentSum = 0;
    for(int num  in nums){
      if(currentSum < 0){
        currentSum = 0;
      }
      currentSum  = currentSum + num;
      maxSum = max(maxSum, currentSum);
    }

    return maxSum;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]));
}
