import 'dart:math';

class Solution {
  int trap(List<int> height) {
    List<int> leftMax = [];
    List<int> rightMax = List.generate(height.length, (index) => index);
    int currentLeftMax = 0;
    int currentRightMax = 0;
    int result = 0;
    for (int i = 0; i < height.length; i++) {
      leftMax.add(currentLeftMax);
      currentLeftMax = max(currentLeftMax, height[i]);
    }
    for (int i = height.length - 1; i >= 0; i--) {
      rightMax[i] = currentRightMax;
      currentRightMax = max(currentRightMax, height[i]);
    }
    print(rightMax);
    print(leftMax);
    for (int i = 0; i < height.length; i++) {
      result = result +
          ((min(leftMax[i], rightMax[i]) - height[i]) >= 0
              ? min(leftMax[i], rightMax[i]) - height[i]
              : 0);
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.trap([4, 2, 0, 3, 2, 5]));
}
