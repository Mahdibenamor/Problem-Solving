import 'dart:math';

class Solution {
  int maxArea(List<int> height) {
    int left = 0;
    int right = height.length - 1; // left,,,,,,,,,,, right
    int maxSurface = 0;
    while (left < right) {
      int surface = ((right - left).abs() * min(height[left], height[right]));
      maxSurface = max(maxSurface, surface);
      if (height[right] > height[left]) {
        left++;
      } else if (height[right] < height[left]) {
        right--;
      } else {
        right--;
      }
    }
    return maxSurface;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.maxArea([1, 8, 6, 2, 5, 4, 8, 3, 7]));
}
