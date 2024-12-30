import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<int> rightSideView(TreeNode? root) {
    Queue<TreeNode?> nodes = Queue.from([root]);
    List<int> result = [];
    while (nodes.isNotEmpty) {
      int genLegth = nodes.length;
      for (int i = 0; i < genLegth; i++) {
        TreeNode? node = nodes.removeLast();
        if (node != null) {
          if (node.left != null) nodes.addFirst(node.left);
          if (node.right != null) nodes.addFirst(node.right);
          if (i == genLegth - 1) {
            result.add(node.val);
          }
        }
      }
    }
    return result;
  }
}

void main() {
  Solution solution = Solution();
}
