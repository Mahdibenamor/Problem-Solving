import 'dart:math';

class Solution {
  Map<(int, int), int> dp = Map();
  int longestCommonSubsequence(String text1, String text2) {
    return dfs((text1), text2, 0, 0);
  }

  int dfs(String text1, String text2, int i, int j) {
    if (dp.containsKey((i, j))) {
      return dp[(i, j)]!;
    }
    if (text1.isEmpty || text2.isEmpty) {
      dp[(i, j)] = 0;
      return 0;
    }
    int lcs = 0;
    if (text1[0] == text2[0]) {
      lcs = 1 + dfs(text1.substring(1), text2.substring(1), i + 1, j + 1);
    } else {
      lcs = max(dfs(text1.substring(1), text2, i + 1, j),
          dfs(text1, text2.substring(1), i, j + 1));
    }
    dp[(i, j)] = lcs;
    return lcs;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.longestCommonSubsequence(
      "pmjghexybyrgzczy", "hafcdqbgncrcbihkd"));
}
