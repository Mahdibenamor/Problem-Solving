class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  bool isSubtree(TreeNode? root, TreeNode? subRoot) {
    if (subRoot == null) return true;
    if (root == null) return false;
    if (isSameTree(root, subRoot)) {
      return true;
    }

    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot);
  }

  bool isSameTree(TreeNode? root, TreeNode? subRoot) {
    if (root == null && subRoot == null) {
      return true;
    }
    if (root != null && subRoot != null && root.val == subRoot.val) {
      return isSameTree(root.left, subRoot.left) &&
          isSameTree(root.right, subRoot.right);
    }
    return false;
  }
}

void main() {
  Solution solution = Solution();
}
