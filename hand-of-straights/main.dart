class Solution {
  bool isNStraightHand(List<int> hand, int groupSize) {
    return hand.length % groupSize == 0;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.isNStraightHand([1, 2, 3, 4, 5, 6], 2));
}
