class TreeNode {
  Map<String, TreeNode> childreen = Map();
  bool endOfWord = false;
  TreeNode();
}

class WordDictionary {
  TreeNode _root = TreeNode();

  WordDictionary();

  void addWord(String word) {
    TreeNode currentNode = _root;
    for (int i = 0; i < word.length; i++) {
      if (!currentNode.childreen.containsKey(word[i])) {
        currentNode.childreen[word[i]] = TreeNode();
      }
      currentNode = currentNode.childreen[word[i]]!;
    }
    currentNode.endOfWord = true;
  }

  bool search(String word) {
    return DFS(word, _root);
  }

  bool DFS(String word, TreeNode currentNode) {
    if (word == "") {
      return currentNode.endOfWord;
    }
    String letter = word[0];
    String nextString = word.substring(1);

    if (letter != '.') {
      if (!currentNode.childreen.containsKey(letter)) {
        return false;
      } else {
        return DFS(nextString, currentNode.childreen[letter]!);
      }
    } else {
      for (String key in currentNode.childreen.keys) {
        if (DFS(nextString, currentNode.childreen[key]!)) {
          return true;
        }
      }
    }
    return false;
  }
}

void main() {
  WordDictionary solution = WordDictionary();
  solution.addWord("at");
  solution.addWord("and");
  solution.addWord("an");
  solution.addWord("add");
  print(solution.search("a"));
}
