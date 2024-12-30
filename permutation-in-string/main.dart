class Solution {
  bool checkInclusion(String s1, String s2) {
    int l = 0;
    int r = 0;
    if (s1.length > s2.length) return false;
    Map<String, int> letters = Map();
    for (int i = 0; i < s1.length; i++) {
      if (letters.containsKey(s1[i])) {
        letters[s1[i]] = letters[s1[i]]! + 1;
      } else {
        letters[s1[i]] = 1;
      }
    }
    Map<String, int> s1Map = Map.from(letters);
    while (l < s2.length && r < s2.length) {
      s1Map = Map.from(letters);
      if (s1Map.containsKey(s2[l])) {
        r = l;
        while (r < s2.length) {
          if (s1Map.containsKey(s2[r])) {
            s1Map[s2[r]] = s1Map[s2[r]]! - 1;
            if (s1Map[s2[r]] == 0) {
              s1Map.remove(s2[r]);
            }
          } else {
            l++;
            break;
          }
          if (r - l + 1 == s1.length) {
            return true;
          }

          r++;
        }
      } else {
        l++;
      }
    }
    return false;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.checkInclusion("adc", "dcda"));
}
