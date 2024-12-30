import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int result = -1;
  int diameterOfBinaryTree(TreeNode? root) {
    dfs(root);
    return result;
  }

  int dfs(TreeNode? root) {
    if (root == null) {
      return -1;
    }
    int left = dfs(root.left);
    int right = dfs(root.right);
    result = max(result, left + right + 2);
    return 1 + max(left, right);
  }
}

void main() {
  Solution solution = Solution();
}
