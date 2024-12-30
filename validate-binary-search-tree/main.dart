class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isValidBST(TreeNode? root) {
    return dfs(root, double.negativeInfinity, double.infinity);
  }

  bool dfs(TreeNode? node, double left, double right) {
    if (node == null) {
      return true;
    }

    if (!(node.val < right && node.val > left)) {
      return false;
    }

    return dfs(node.left, left, node.val.toDouble()) &&
        dfs(node.right, node.val.toDouble(), right);
  }
}
