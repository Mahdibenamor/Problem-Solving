class Solution {
  int findDuplicate(List<int> nums) {
    int getNextNode(int node) {
      return nums[node];
    }

    int fast = 0;
    int slow = 0;
    while (true) {
      slow = getNextNode(slow);
      fast = getNextNode(getNextNode(fast));
      if (fast == slow) {
        break;
      }
    }
    int slow2 = 0;
    while (slow != slow2) {
      slow = getNextNode(slow);
      slow2 = getNextNode(slow2);
    }
    return slow;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.findDuplicate([1, 3, 4, 2, 2]));
}
