import 'dart:math';

class Solution {
  String word1 = "";
  String word2 = "";
  Map<(int, int), int> dp = Map();
  int minDistance(String word1, String word2) {
    this.word1 = word1;
    this.word2 = word2;
    return dfs(0, 0);
  }

  int dfs(int i, int j) {
    if (dp.containsKey((i, j))) {
      return dp[(i, j)]!;
    }
    if (i == word1.length && j == word2.length) {
      return 0;
    }
    if (i == word1.length) {
      return word2.length - j;
    }
    if (j == word2.length) {
      return word1.length - i;
    }
    int result = 0;
    if (word1[i] == word2[j]) {
      result = dfs(i + 1, j + 1);
    } else {
      int res = min(dfs(i + 1, j) + 1, dfs(i, j + 1) + 1);
      res = min(res, dfs(i + 1, j + 1) + 1);
      result = res;
    }
    dp[(i, j)] = result;
    return result;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.minDistance("horse", "o"));
}
