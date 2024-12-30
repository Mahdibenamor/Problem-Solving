class Solution {
  List<int> nums = [];
  int target = 0;
  num result = double.infinity;
  int search(List<int> nums, int target) {
    this.nums = nums;
    this.target = target;
    binarySearch(0, nums.length - 1);
    return result.toInt();
  }

  void binarySearch(int start, end) {
    if (start > end) {
      return;
    }
    int mid = (start + end) ~/ 2;
    if (nums[mid] == target) {
      result = mid;
      return;
    }

    if (target < nums[end] && target < nums[mid]) {
      return binarySearch(mid + 1, end);
    }
    if (target > nums[start] && target < nums[mid]) {
      return binarySearch(start, mid - 1);
    }
    if (target > nums[mid]) {
      return binarySearch(mid + 1, end);
    } else {
      return binarySearch(start, mid - 1);
    }
  }
}

main() {
  Solution solution = new Solution();
  print(solution.search([1, 2, 3, 4, 5, 6, 7], 5));
}
