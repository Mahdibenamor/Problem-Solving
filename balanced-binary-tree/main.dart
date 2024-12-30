import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool result = true;
  bool isBalanced(TreeNode? root) {
    height(root);
    return result;
  }

  int height(TreeNode? node) {
    if (result == false) {
      return 0;
    }
    if (node == null) {
      return 0;
    }
    int left = height(node.left);
    int right = height(node.right);
    if ((left - right).abs() > 1) {
      result = false;
    }
    return 1 + max(left, right);
  }
}

void main() {
  Solution solution = Solution();
}
