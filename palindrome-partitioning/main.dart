class Solution {
  List<List<String>> solution = List.empty(growable: true);
  List<List<String>> partition(String s) {
    dfs(s, []);
    return solution;
  }

  dfs(String str, List<String> partition) {
    if (str.isEmpty) {
      if (partition.isNotEmpty) {
        solution.add(partition);
      }
      return;
    }
    for (int i = 0; i < str.length; i++) {
      String palandrom = str.substring(0, i + 1);
      if (isPalandrom(palandrom)) {
        List<String> currentPartition = [...partition];
        currentPartition.add(palandrom);
        dfs(str.substring(i + 1), currentPartition);
      }
    }
  }

  bool isPalandrom(str) {
    int left = 0;
    int right = str.length - 1;
    while (left <= right) {
      if (str[left] != str[right]) {
        return false;
      }
      left++;
      right--;
    }
    return true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.partition("aab"));
  //print(solution.isPalandrom("aa"));
}
