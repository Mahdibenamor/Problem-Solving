class Solution {
  bool containsDuplicate(List<int> nums) {
    Map<int, int> map = Map();
    for (var num in nums) {
      if (map.containsKey(num)) {
        return true;
      } else {
        map[num] = 1;
      }
    }
    return false;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.containsDuplicate([1, 2, 3, 1]));
}
