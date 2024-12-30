class Solution {
  bool canJump(List<int> nums) {
    if (nums.length == 1) {
      return true;
    }
    int pointer = nums.length - 1;
    for (int i = nums.length - 2; i >= 0; i--) {
      if (i + nums[i] >= pointer) {
        pointer = i;
      }
    }
    if (pointer == 0)
      return true;
    else
      return false;
  }
}

main() {
  Solution solution = new Solution();
  List<int> change = [9, 8, 5, 0, 3, 6, 4, 2, 6, 8];
  print(solution.canJump(change));
}
