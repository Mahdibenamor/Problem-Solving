import 'dart:collection';
import 'dart:math';

class Step {
  final int index;
  final int jumps;
  Step({required this.index, required this.jumps});
}

class Solution {
  int canJumpII1(List<int> nums) {
    if (nums.length == 1) {
      return 0;
    }
    Queue<Step> steper = Queue<Step>();
    steper.addLast(Step(index: 0, jumps: 0));
    for (int i = 1; i <= nums[0]; i++) {
      steper.addFirst(Step(index: i, jumps: 1));
    }
    while (steper.isNotEmpty) {
      Step curentStep = steper.removeLast();
      if (curentStep.index + nums[curentStep.index] >= nums.length - 1) {
        return curentStep.jumps + 1;
      } else {
        for (int i = 1; i <= nums[curentStep.index]; i++) {
          if (!steper.any((element) => element.index == curentStep.index + i)) {
            steper.addFirst(
                Step(index: curentStep.index + i, jumps: curentStep.jumps + 1));
          }
        }
      }
    }
    return 0;
  }

  int canJumpII(List<int> nums) {
    int minJumps = 0;
    int left = 0;
    int right = 0;
    while (right < nums.length - 1) {
      int newRight = 0;
      for (int i = left; i <= right; i++) {
        newRight = max(newRight, i + nums[i]);
      }
      left = right + 1;
      right = newRight;
      minJumps++;
    }
    return minJumps;
  }

  bool canJump(List<int> nums) {
    int pointer = nums.length - 1;
    for (int i = nums.length - 2; i >= 0; i--) {
      if (i + nums[i] >= pointer) {
        pointer = i;
      }
    }
    if (pointer == 0)
      return true;
    else
      return false;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.canJumpII([2, 3, 1, 1, 4]));
}
