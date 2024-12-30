String findLongestWord(String s, List<String> dictionary) {
  String max = "";
  for (var element in dictionary) {
    if (element.length > max.length) {
      if (isSbusequence(element, s)) {
        max = element;
      }
    } else if (element.length == max.length) {
      if (isSbusequence(element, s) && element.compareTo(max) < 0) {
        max = element;
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

main() {
  print(findLongestWord("abpcplea", ["a", "b", "c"]));
}
