import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int maxDepth(TreeNode? root) {
    if (root == null) {
      return 0;
    }
    return max(1 + maxDepth(root.left), 1 + maxDepth(root.right));
  }
}

void main() {
  Solution solution = Solution();
}
