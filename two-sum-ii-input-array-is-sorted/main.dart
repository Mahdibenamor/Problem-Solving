class Solution {
  List<int> twoSum(List<int> numbers, int target) {
    int right = numbers.length - 1;
    int left = 0;
    while (right > left) {
      if (numbers[right] + numbers[left] == target) {
        return [left + 1, right + 1];
      }

      if (numbers[right] + numbers[left] > target) {
        right--;
      }
      if (numbers[right] + numbers[left] < target) {
        left++;
      }
    }
    return [];
  }
}

main() {
  Solution solution = new Solution();
  print(solution.twoSum([-1, 0], -1));
}
