class Solution {
  int amount = 0;
  List<int> coins = [];
  Map<(int, int), int> cache = Map();

  int change(int amount, List<int> coins) {
    this.amount = amount;
    this.coins = coins;
    return dfs(0, 0);
  }

  int dfs(int k, int s) {
    if (cache.containsKey((k, s))) {
      return cache[(k, s)]!;
    }
    if (s == amount) {
      return 1;
    }
    if (s > amount) {
      return 0;
    }
    int localSolution = 0;
    for (int i = k; i < coins.length; i++) {
      localSolution = localSolution + dfs(i, s + coins[i]);
    }

    cache[(k, s)] = localSolution;
    return localSolution;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.change(10, [10]));
}
