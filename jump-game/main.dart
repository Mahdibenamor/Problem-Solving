class Solution {
  bool canJump2(List<int> nums) {
    return canReach2(0, nums[0], nums);
  }

  Map<(int, int), int> infoLocation = Map();
  Map<(int, int), bool> locationResult = Map();

  bool canJump(List<int> nums) {
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

  Map<(int, int), bool> dp = Map();

  bool canReach2(int start, int jumps, List<int> nums) {
    if (dp.containsKey((start, jumps))) {
      return dp[((start, jumps))]!;
    }
    bool canReachEnd = false;
    if (nums.length == 1) {
      return true;
    }
    for (int i = 1; i <= jumps; i++) {
      if (start + i == nums.length - 1) {
        canReachEnd = true;
        dp[(start, i)] = true;
        break;
      }
      if (start + i > nums.length - 1) {
        canReachEnd = false;
        dp[(start, i)] = false;
        break;
      }
      if (start + i < nums.length - 1) {
        if (canReach2(start + i, nums[start + i], nums)) {
          dp[(start + i, nums[start + i])] = true;
          canReachEnd = true;
          break;
        }
      }
    }
    dp[(start, jumps)] = canReachEnd;
    return canReachEnd;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.canJump([0]));
}
