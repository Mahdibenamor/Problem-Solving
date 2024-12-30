class Solution {
  Map<String, String> decoder = {
    "1": "A",
    "2": "B",
    "3": "C",
    "4": "D",
    "5": "E",
    "6": "F",
    "7": "G",
    "8": "H",
    "9": "I",
    "10": "J",
    "11": "K",
    "12": "L",
    "13": "M",
    "14": "N",
    "15": "O",
    "16": "P",
    "17": "Q",
    "18": "R",
    "19": "S",
    "20": "T",
    "21": "U",
    "22": "V",
    "23": "W",
    "24": "X",
    "25": "Y",
    "26": "Z",
  };
  int numDecodings(String s) {
    Map<String, int> dp = Map();

    int dfs(String takenString, String toBuildString) {
      if (dp.containsKey(takenString)) {
        return dp[takenString]!;
      }
      int localSolution = 0;
      if (toBuildString.isEmpty) {
        return 1;
      }
      for (int i = 1; i <= toBuildString.length; i++) {
        String prefixTocheck = toBuildString.substring(0, i);
        if (IsValid(prefixTocheck)) {
          String localTakenString = takenString + prefixTocheck;
          String LocalToBuild = toBuildString.substring(i);
          localSolution = localSolution + dfs(localTakenString, LocalToBuild);
        } else {
          break;
        }
      }
      dp[takenString] = localSolution;

      return localSolution;
    }

    return dfs("", s);
  }

  bool IsValid(String s) {
    if (s.startsWith("0")) {
      return false;
    }
    return decoder.containsKey(s);
  }
}

void main() {
  Solution solution = Solution();
  print(solution.numDecodings("226"));
}
