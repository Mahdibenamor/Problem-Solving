class Solution {
  List<int> piles = [];
  int h = 0;
  int minEatingSpeed(List<int> piles, int h) {
    this.piles = piles;
    this.h = h;
    int kmin = 1;
    int kmax = 0;
    for (int pile in piles) {
      if (pile > kmax) {
        kmax = pile;
      }
    }
    return binarySearch(kmin, kmax);
  }

  int binarySearch(int start, int end) {
    if (end - start == 1) {
      if (canEatWithSpeed(piles, start, h)) {
        return start;
      }
      if (canEatWithSpeed(piles, end, h)) {
        return end;
      }
    }
    int mid = (start + end) ~/ 2;
    if (canEatWithSpeed(piles, mid, h)) {
      return binarySearch(start, mid);
    } else {
      return binarySearch(mid, end);
    }
  }

  bool canEatWithSpeed(List<int> piles, int speed, int h) {
    int actualSpeed = 0;
    for (int pile in piles) {
      actualSpeed = actualSpeed + ((pile / speed)).ceil();
    }
    return actualSpeed <= h;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.minEatingSpeed([30, 11, 23, 4, 20], 6));
  //print(solution.canEatWithSpeed([30, 11, 23, 4, 20], 30, 5));
}
