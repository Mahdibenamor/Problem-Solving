class Solution {
  List<int> partitionLabels(String s) {
    Map<String, int> lastIndex = Map();
    List<int> result = [];
    for (int i = 0; i < s.length; i++) {
      lastIndex[s[i]] = i;
    }

    int counter = 0;
    int size = 0;
    int end = 0;
    while (counter < s.length) {
      size++;
      if (lastIndex[s[counter]]! > end) {
        end = lastIndex[s[counter]]!;
      }

      if (counter == end) {
        result.add(size);
        size = 0;
      }
      counter++;
    }
    return result;
  }
}

main() {
  Solution solution = new Solution();
  print(solution.partitionLabels("ababcbacadefegdehijhklij"));
}
