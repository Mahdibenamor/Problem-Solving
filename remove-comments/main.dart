List<String> removeComments(List<String> source) {
  bool stillInComments = false;
  List<String> codesResult = List.empty(growable: true);
  for (var sentence in source) {
    (List<String>, bool) codes = getCodes(sentence, stillInComments);
    stillInComments = codes.$2;
    codesResult.addAll(codes.$1);
  }
  return codesResult;
}

(List<String>, bool) getCodes(String sentence, bool stillInComments) {
  if (sentence.isEmpty) {
    return ([], stillInComments);
  }
  if (stillInComments) {
    int endComment = sentence.indexOf("*/");
    if (endComment == -1) {
      return ([], true); // it is all in  the comment
    } else if (endComment == sentence.length - 2) {
      return ([], false); // the comment ends at the end
    } else {
      sentence = sentence.substring(endComment + 2);
      return getCodes(sentence, false); // it ends and then we have code
    }
  } else {
    int startComment = sentence.indexOf("/*");
    int allComment = sentence.trim().indexOf("//");
    if (allComment == 0) {
      return ([], false);
    }
    if (startComment != -1) {
      String currentCode = sentence.substring(0, startComment);
      sentence = sentence.substring(startComment + 2, sentence.length);
      List<String> codes = List.empty(growable: true);
      (List<String>, bool) childCodes = getCodes(sentence, true);
      if (currentCode != "") {
        codes.add(currentCode);
      }
      codes.addAll(childCodes.$1);
      return (codes, childCodes.$2);
    } else {
      return ([sentence], false);
    }
  }
}

//        if (!currentCode.endsWith(';')) {}

main() {
  print(removeComments(["a/*comment", "line", "more_comment*/b"]));
}
