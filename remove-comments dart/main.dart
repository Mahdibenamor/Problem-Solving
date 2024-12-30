List<String> removeComments(List<String> source) {
  bool stillInComments = false;
  bool mergeCode = false;
  List<String> codesResult = List.empty(growable: true);
  for (var sentence in source) {
    (List<String>, bool, bool) codes =
        getCodes(sentence, stillInComments, mergeCode);
    stillInComments = codes.$2;
    if (mergeCode) {
      if (codes.$1.length > 0) {
        String elementToMerge = codes.$1.first;
        codesResult.last = codesResult.last + elementToMerge;
        codes.$1.removeAt(0);
      }
    }
    mergeCode = codes.$3;
    codesResult.addAll(codes.$1);
  }
  return codesResult;

  /*v/*v */*/
}

(List<String>, bool, bool) getCodes(
    String sentence, bool stillInComments, bool mergeCode) {
  if (sentence.isEmpty) {
    return ([], stillInComments, false);
  }
  if (stillInComments) {
    int endComment = sentence.indexOf("*/");
    if (endComment == -1) {
      return ([], true, true); // the setence all is a comment
    } else if (endComment == sentence.length - 2) {
      return ([], false, false); // the comment ends at the end of the sentence
    } else {
      sentence = sentence.substring(endComment + 2);
      return getCodes(sentence, false, false); // it ends and then we have code
    }
  } else {
    int startComment = sentence.indexOf("/*");
    int allComment = sentence.indexOf("//");
    if (allComment != -1) {
      return ([sentence.substring(0, sentence.indexOf("//"))], false, false);
    }
    if (startComment != -1) {
      String currentCode = sentence.substring(0, startComment);
      sentence = sentence.substring(startComment + 2, sentence.length);

      List<String> codes = List.empty(growable: true);
      (List<String>, bool, bool) childCodes = getCodes(sentence, true, false);
      if (currentCode != "") {
        codes.add(currentCode);
      }
      codes.addAll(childCodes.$1);
      return (codes, childCodes.$2, childCodes.$3);
    } else {
      return ([sentence], false, mergeCode);
    }
  }
}

main() {
  print(removeComments(["    /**/int val;"]));
  // print(removeComments([
  //   "/*Test program */",
  //   "int main()",
  //   "{ ",
  //   "  // variable declaration ",
  //   "int a, b, c;",
  //   "/* This is a test",
  //   "   multiline  ",
  //   "   comment for ",
  //   "   testing */",
  //   "a = b + c;",
  //   "}"
  // ]));
  // print(getCodes("    /**/int val;", false, false));
  //print(getCodes("  // variable declaration ", false, false));
}
