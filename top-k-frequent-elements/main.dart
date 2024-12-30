class Solution {
  List<int> topKFrequent(List<int> nums, int k) {
    Map<int, int> map = Map();
    for (int num in nums) {
      if (map.containsKey(num)) {
        map[num] = map[num]! + 1;
      } else {
        map[num] = 1;
      }
    }
    List<int> solution = [];
    for (int i = 1; i <= k; i++) {
      int localMax = 0;
      int maxIndex = -1;
      for (var key in map.keys) {
        if (map[key]! >= localMax) {
          localMax = map[key]!;
          maxIndex = key;
        }
      }
      solution.add(maxIndex);
      map.remove(maxIndex);
    }
    return solution;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.topKFrequent([1, 1, 1, 2, 2, 3], 2));
}
