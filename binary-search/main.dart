class Solution {
  int search(List<int> nums, int target) {
    int searchRec(int start, int end) {
      if (start > end) {
        return -1;
      }
      if (nums[start] == target) return start;

      if (nums[end] == target) return end;
      int middle = (start + end) ~/ 2;
      if (nums[middle] == target) {
        return middle;
      }
      if (nums[middle] < target) {
        return searchRec(middle, end - 1);
      } else {
        return searchRec(start + 1, middle);
      }
    }

    return searchRec(0, nums.length - 1);
  }
}

main() {
  Solution solution = new Solution();
  print(solution.search([1, 12], 9));
}
