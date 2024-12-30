class Solution {
  Map<String, List<String>> dict = {
    "2": ["a", "b", "c"],
    "3": ["d", "e", "f"],
    "4": ["g", "h", "i"],
    "5": ["j", "k", "l"],
    "6": ["m", "n", "o"],
    "7": ["p", "q", "r", "s"],
    "8": ["t", "u", "v"],
    "9": ["w", "x", "y", "z"],
  };
  List<String> solution = List.empty(growable: true);
  List<String> letterCombinations(String digits) {
    return dfs(digits);
  }

  List<String> dfs(String str) {
    List<String> solution = List.empty(growable: true);
    if (str.isEmpty) {
      return [];
    }
    if (str.length == 1) {
      return dict[str]!;
    }
    String char = str[0];
    for (int i = 0; i < dict[char]!.length; i++) {
      List<String> subpartitions = dfs(str.substring(1));
      for (String subpartition in subpartitions) {
        solution.add(dict[char]![i] + subpartition);
      }
    }

    return solution;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.letterCombinations("23"));
  //print(solution.isPalandrom("aa"));
}
