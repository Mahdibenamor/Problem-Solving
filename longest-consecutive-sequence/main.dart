import 'dart:math';

class Solution {
  int longestConsecutive(List<int> nums) {
    if (nums.isEmpty) {
      return 0;
    }
    Set<int> set = Set.from(nums);
    print(set);
    bool isStart = false;
    bool reachEnd = false;
    int length = 0;
    int result = 1;
    for (int num in nums) {
      if (!set.contains(num - 1)) {
        isStart = true;
        reachEnd = false;
        length = 1;
      }
      while (isStart && !reachEnd) {
        if (set.contains(num + length)) {
          length++;
        } else {
          reachEnd = true;
          isStart = false;
          result = max(result, length);
        }
      }
    }
    return result;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]));
}
