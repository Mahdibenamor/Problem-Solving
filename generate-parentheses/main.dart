class Solution {
  int n = 0;
  List<String> result = [];
  List<String> generateParenthesis(int n) {
    this.n = n;
    dfs("", 0, 0);
    return result;
  }

  dfs(String str, int open, int close) {
    if (open == close && open == n) {
      result.add(str);
    }
    if (open < n) {
      String copy = str + "(";
      dfs(copy, open + 1, close);
    }
    if (close < n && open > close) {
      String copy = str + ")";
      dfs(copy, open, close + 1);
    }
  }
}

main() {
  Solution solution = new Solution();
  print(solution.generateParenthesis(3));
}
