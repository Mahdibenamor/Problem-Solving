List<List<String>> findDuplicate(List<String> paths) {
  Map<String, int> itemsCount = Map();
  Map<String, List<String>> dp = Map();
  List<List<String>> result = List.empty(growable: true);
  for (var dic in paths) {
    List<String> dictoryContent = dic.split(' ');
    String root = dictoryContent[0];
    for (var i = 1; i < dictoryContent.length; i++) {
      int fileNameStop = dictoryContent[i].indexOf('(');
      String fileName = dictoryContent[i].substring(0, fileNameStop);
      String fileContent = dictoryContent[i]
          .substring(fileNameStop + 1, dictoryContent[i].length - 1);

      if (dp.containsKey(fileContent)) {
        dp[fileContent]!.add(root + '/' + fileName);
        itemsCount[fileContent] = itemsCount[fileContent]! + 1;
      } else {
        dp[fileContent] = List.empty(growable: true);
        itemsCount[fileContent] = 1;
        dp[fileContent]!.add(root + '/' + fileName);
      }
    }
  }

  itemsCount.forEach((key, value) {
    if (value > 1) {
      result.add(dp[key]!);
    }
  });

  return result;
}

main() {
  List<List<String>> result = findDuplicate([
    "root/a 1.txt(abcd) 2.txt(efgh)",
    "root/c 3.txt(abcd)",
    "root/c/d 4.txt(efgh)",
    "root 4.txt(efgh)"
  ]);

  print(result);
}
