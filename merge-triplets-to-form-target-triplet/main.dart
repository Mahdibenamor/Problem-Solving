class Solution {
  bool mergeTriplets(List<List<int>> triplets, List<int> target) {
    List<List<int>> newTriplets = [];
    for (List<int> triplet in triplets) {
      if (!(triplet[0] > target[0] ||
          triplet[1] > target[1] ||
          triplet[2] > target[2])) {
        newTriplets.add(triplet);
      }
    }
    bool a = false;
    bool b = false;
    bool c = false;
    for (List<int> triplet in newTriplets) {
      if (triplet[0] == target[0]) {
        a = true;
      }
      if (triplet[1] == target[1]) {
        b = true;
      }
      if (triplet[2] == target[2]) {
        c = true;
      }
    }

    return a && b && c;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.mergeTriplets([
    [2, 5, 3],
    [2, 3, 4],
    [1, 2, 5],
    [5, 2, 3]
  ], [
    5,
    5,
    5
  ]));
}
