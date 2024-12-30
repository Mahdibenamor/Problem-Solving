class Solution {
  List<int> twoSum(List<int> nums, int target) {
    Map<int, int> map = Map();
    for (int i = 0; i < nums.length; i++) {
      map[nums[i]] = i;
    }
    for (int i = 0; i < nums.length; i++) {
      if (map.containsKey(target - nums[i]) && i != map[target - nums[i]]) {
        return [i, map[target - nums[i]]!];
      }
    }

    return [0, 0];
  }
}

void main() {
  Solution solution = Solution();
  print(solution.twoSum([3, 2, 4], 6));
}
