class Solution {
  List<int> productExceptSelf(List<int> nums) {
    List<int> upProduct = [];
    List<int> downProduct = [];
    List<int> result = [];
    int upSum = 1;
    int downSum = 1;
    for (int i = 0; i < nums.length; i++) {
      upSum = upSum * nums[i];
      upProduct.add(upSum);
      downSum = downSum * nums[nums.length - 1 - i];
      downProduct.add(downSum);
    }
    downProduct = downProduct.reversed.toList();
    for (int i = 0; i < nums.length; i++) {
      int left = i == 0 ? 1 : upProduct[i - 1];
      int right = i == nums.length - 1 ? 1 : downProduct[i + 1];
      result.add(left * right);
    }
    return result;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.productExceptSelf([-1, 1, 0, -3, 3]));
}
