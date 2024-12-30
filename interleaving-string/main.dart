class Solution {
  String s1 = "";
  String s2 = "";
  String s3 = "";
  Map<(int, int), bool> dp = Map();
  bool isInterleave(String s1, String s2, String s3) {
    this.s1 = s1;
    this.s2 = s2;
    this.s3 = s3;
    return dfs(0, 0, 0);
  }

  bool dfs(int i, int j, int k) {
    if (dp.containsKey((i, j))) {
      return dp[(i, j)]!;
    }

    if (i == s1.length && j == s2.length && k == s3.length) {
      return true;
    }
    bool result = false;
    if (i < s1.length && k < s3.length && s1[i] == s3[k]) {
      result = result || dfs(i + 1, j, k + 1);
    }
    if (j < s2.length && k < s3.length && s2[j] == s3[k] && !result) {
      result = result || dfs(i, j + 1, k + 1);
    }
    dp[(i, j)] = result;
    return result;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.isInterleave("a", "b", "a"));
}
