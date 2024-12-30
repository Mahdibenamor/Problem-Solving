import 'dart:math';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool result = true;
  bool isSameTree(TreeNode? p, TreeNode? q) {
    dfs(p, q);
    return result;
  }

  dfs(TreeNode? p, TreeNode? q) {
    if (!result) {
      return;
    }
    if (p == null && q == null) {
      return;
    }
    if (p == null && q != null) {
      result = false;
      return;
    }
    if (q == null && p != null) {
      result = false;
    }
    if (p?.val != q?.val) {
      result = false;
      return;
    }
    dfs(p?.left, q?.left);
    dfs(p?.right, q?.right);
  }
}

void main() {
  Solution solution = Solution();
}
