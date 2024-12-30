class Solution {
  List<int> nums = [];
  num result = double.infinity;
  int findMin(List<int> nums) {
    this.nums = nums;
    binarySearch(0, nums.length - 1);
    return result.toInt();
  }

  void binarySearch(int start, end) {
    if (start > end) {
      return;
    }
    int mid = (start + end) ~/ 2;
    if (nums[mid] < result) {
      result = nums[mid];
    }
    if (nums[mid] > nums[end]) {
      return binarySearch(mid + 1, end);
    }
    if (nums[start] > nums[end]) {
      return binarySearch(start, mid - 1);
    }
    return binarySearch(start, mid - 1);
  }
}

main() {
  Solution solution = new Solution();
  print(solution.findMin([5, 1, 2, 3, 4]));
}
