class Trie {
  List<String> _words = [];
  Trie() {}

  void insert(String word) {
    _words.add(word);
  }

  bool search(String word) {
    return _words.any((element) => element == word);
  }

  bool startsWith(String prefix) {
    if (_words.isEmpty) {
      return false;
    }
    return _words.last.startsWith(prefix);
  }
}

/**
 * Your Trie object will be instantiated and called as such:
 * Trie obj = Trie();
 * obj.insert(word);
 * bool param2 = obj.search(word);
 * bool param3 = obj.startsWith(prefix);
 */
main() {
  //print(removeComments(["a/*comment", "line", "more_comment*/b"]));
}
