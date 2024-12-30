class TreeNode {
  bool endOfWord = false;
  Map<String, TreeNode> childreen = Map();
  TreeNode();
}

class Trie {
  TreeNode _root = TreeNode();
  Trie() {}

  void insert(String word) {
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
    TreeNode currentNode = _root;
    for (int i = 0; i < word.length; i++) {
      if (!currentNode.childreen.containsKey(word[i])) {
        return false;
      }
      currentNode = currentNode.childreen[word[i]]!;
    }
    return currentNode.endOfWord;
  }

  bool startsWith(String prefix) {
    TreeNode currentNode = _root;
    for (int i = 0; i < prefix.length; i++) {
      if (!currentNode.childreen.containsKey(prefix[i])) {
        return false;
      }
      currentNode = currentNode.childreen[prefix[i]]!;
    }
    return true;
  }
}

void main() {
  Trie solution = Trie();
  solution.insert("app");
  solution.insert("apple");
  solution.insert("beer");
  solution.insert("add");
  solution.insert("jam");
  solution.insert("rental");
  print(solution.startsWith("app"));
  //print(solution.isPalandrom("aa"));
}
