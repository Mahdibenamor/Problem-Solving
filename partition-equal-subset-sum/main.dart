class Solution {
  bool canPartition(List<int> nums) {
    int sum = 0;
    for (int num in nums) {
      sum = sum + num;
    }
    if (sum % 2 == 1) {
      return false;
    }
    Set<int> dp = Set();
    dp.add(0);
    print("sum is :  $sum");
    print((sum / 2).toInt());
    for (int num in nums) {
      Set<int> copyDp = dp.toSet();
      for (var value in copyDp.toList()) {
        dp.add(value + num);
      }
    }
    print(dp);

    if (dp.contains(4)) {
      return true;
    }
    return false;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.canPartition([1, 2, 5]));
}
