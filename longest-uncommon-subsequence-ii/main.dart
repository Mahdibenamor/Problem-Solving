import 'dart:math';

main() {
  print(findLUSlength(
      ["a", "b", "c", "d", "e", "f", "a", "b", "c", "d", "e", "f"]));
}

int findLUSlength(List<String> strs) {
  int result = -1;
  for (int i = 0; i < strs.length; i++) {
    bool isCommon = false;
    for (int j = 0; j < strs.length; j++) {
      if (i == j) continue;
      if (isSbusequence(strs[i], strs[j])) {
        isCommon = true;
        break;
      }
      if (strs[i] == strs[j]) {
        isCommon = true;
        break;
      }
    }
    if (!isCommon) {
      result = max(result, strs[i].length);
    }
  }
  return result;
}

bool isSbusequence(String str, String string) {
  int j = 0;
  int i = 0;
  while (i < string.length && j < str.length) {
    if (string[i] == str[j]) {
      j++;
    }
    i++;
  }
  return j == str.length;
}
