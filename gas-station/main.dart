class Solution {
  int canCompleteCircuit(List<int> gas, List<int> cost) {
    List<int> diff = [];
    int total = 0;
    for (int i = 0; i < gas.length; i++) {
      int etag = gas[i] - cost[i];
      diff.add(etag);
      total += etag;
    }
    if (total < 0) {
      return -1;
    }
    total = 0;
    int pointer = 0;
    for (int i = 0; i < diff.length; i++) {
      total += diff[i];
      if (total < 0) {
        total = 0;
        pointer = i + 1;
      }
    }
    return pointer;
  }
}

main() {
  Solution solution = new Solution();
  print(
      solution.canCompleteCircuit([-1, 0, 1, 2, -1, -4, -2, -3, 3, 0, 4], []));
}
