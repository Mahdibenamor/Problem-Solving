class Solution {
  bool isAnagram(String s, String t) {
    Map<String, int> map1 = Map();
    Map<String, int> map2 = Map();
    for (int i = 0; i < s.length; i++) {
      if (map1.containsKey(s[i])) {
        map1[s[i]] = map1[s[i]]! + 1;
      } else {
        map1[s[i]] = 1;
      }
    }

    for (int i = 0; i < t.length; i++) {
      if (map2.containsKey(t[i])) {
        map2[t[i]] = map2[t[i]]! + 1;
      } else {
        map2[t[i]] = 1;
      }
    }

    for (var key in map2.keys) {
      if (!map1.containsKey(key)) {
        return false;
      }
      if (map1[key] != map2[key]) {
        return false;
      }
    }
    for (var key in map1.keys) {
      if (!map2.containsKey(key)) {
        return false;
      }
      if (map1[key] != map2[key]) {
        return false;
      }
    }

    return true;
  }
}

void main() {
  Solution solution = Solution();
  print(solution.isAnagram("aa", "a"));
}
