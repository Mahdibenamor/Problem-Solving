class Solution {
  String longestWord(List<String> words) {
    String max = "";
    List<String> entryNodes =
        words.where((element) => element.length == 1).toList();
    if (entryNodes.isEmpty) {
      return max;
    } else {
      for (var entry in entryNodes) {
        String entryMax = longestWordRecrusive(entry, words);
        if (entryMax.length > max.length) {
          max = entryMax;
        }
        if (entryMax.length == max.length) {
          if (entryMax.compareTo(max) < 0) {
            max = entryMax;
          }
        }
      }
    }
    return max;
  }

  String longestWordRecrusive(String nodeString, List<String> words) {
    List<String> childNodes = words
        .where((element) =>
            element.length == nodeString.length + 1 &&
            isSbusequence(nodeString, element))
        .toList();
    if (childNodes.isEmpty) {
      return nodeString;
    }
    String max = "";
    for (var child in childNodes) {
      String childMax = longestWordRecrusive(child, words);
      if (childMax.length > max.length) {
        max = childMax;
      } else {
        if (childMax.length == max.length) {
          if (childMax.compareTo(max) < 0) {
            max = childMax;
          }
        }
      }
    }
    return max;
  }

  bool isSbusequence(String subSequence, String string) {
    int j = 0;
    int i = 0;
    while (i < string.length && j < subSequence.length) {
      if (string[i] == subSequence[j]) {
        j++;
      }
      i++;
    }
    return j == subSequence.length;
  }
}

main() {
  Solution solution = new Solution();
  print(solution
      .longestWord(["a", "banana", "app", "appl", "ap", "apply", "apple"]));
}
