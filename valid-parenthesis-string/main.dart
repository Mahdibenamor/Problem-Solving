class Solution {
  String str = "";
  bool hasSolution = false;
  Map<(int, int), bool> dp = Map();
  bool checkValidString(String s) {
    str = s;
    return dfs(0, 0);
  }

  bool dfs(int currentIndex, int openNumber) {
    if (openNumber < 0) {
      dp[(currentIndex, openNumber)] = false;
      return false;
    }

    if (currentIndex == str.length) {
      dp[(currentIndex, openNumber)] = openNumber == 0;
      return openNumber == 0;
    }

    if (dp.containsKey((currentIndex, openNumber))) {
      return dp[(currentIndex, openNumber)]!;
    }
    if (str[currentIndex] == ')') {
      bool result = dfs(currentIndex + 1, openNumber - 1);
      dp[(currentIndex, openNumber)] = result;
      return result;
    } else if (str[currentIndex] == '(') {
      bool result = dfs(currentIndex + 1, openNumber + 1);
      dp[(currentIndex, openNumber)] = result;
      return result;
    } else {
      bool result = dfs(currentIndex + 1, openNumber + 1) ||
          dfs(currentIndex + 1, openNumber - 1) ||
          dfs(currentIndex + 1, openNumber);
      dp[(currentIndex, openNumber)] = result;
      return result;
    }
  }
}

main() {
  Solution solution = new Solution();
  print(solution.checkValidString(
      ("**************************************************))))))))))))))))))))))))))))))))))))))))))))))))))")));
}
