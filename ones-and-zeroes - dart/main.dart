import 'dart:math';

int findMaxForm(List<String> strs, int m, int n) {
  var dp = {};
  int dfs(int i, int m, int n) {
    if (i == strs.length) {
      return 0;
    }
    if (dp.containsKey((i, m, n))) {
      return dp[(i, m, n)];
    }

    int mCnt = strs[i].split('0').length - 1;
    int nCnt = strs[i].split('1').length - 1;
    dp[(i, m, n)] = dfs(i + 1, m, n);
    if (mCnt <= m && nCnt <= n) {
      dp[(i, m, n)] =
          max(dp[(i, m, n)] as int, 1 + dfs(i + 1, m - mCnt, n - nCnt));
    }

    return dp[(i, m, n)] as int;
  }

  return dfs(0, m, n);
}

main() {
  List<String> strs = ["10", "0001", "111001", "1", "0"];
  int m = 5;
  int n = 3;
  print(findMaxForm(strs, m, n));
}
