class Solution {
  bool wordBreak(String s, List<String> wordDict) {
    Map<String, bool> dp = Map();
    bool dfs(String s) {
      if (dp.containsKey(s)) {
        return dp[s]!;
      }
      if (s.isEmpty) {
        return true;
      }
      for (String word in wordDict) {
        int wordStartPosition = s.indexOf(word);
        if (wordStartPosition == 0) {
          String substring = s.substring(word.length);
          if (dfs(substring)) {
            dp[s] = true;
            return true;
          }
        }
      }
      dp[s] = false;
      return false;
    }

    return dfs(s);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.wordBreak(
      "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab",
      [
        "a",
        "aa",
        "aaa",
        "aaaa",
        "aaaaa",
        "aaaaaa",
        "aaaaaaa",
        "aaaaaaaa",
        "aaaaaaaaa",
        "aaaaaaaaaa"
      ]));
}
