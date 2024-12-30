class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> map = Map();
    for (String str in strs) {
      String sortedStr = sortString(str);
      if (map.containsKey(sortedStr)) {
        map[sortedStr]!.add(str);
      } else {
        map[sortedStr] = [str];
      }
    }
    List<List<String>> result = map.values.toList();
    result.sort((a, b) => a.length.compareTo(b.length));
    return result;
  }

  String sortString(String str) {
    List<String> strs = str.split('');
    strs.sort();
    return strs.join('');
  }
}

main() {
  Solution solution = new Solution();
  print(solution.groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]));
}
