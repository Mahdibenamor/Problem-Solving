class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? invertTree(TreeNode? root) {
    if (root == null) {
      return null;
    }

    TreeNode? aux = root.left;
    root.left = root.right;
    root.right = aux;

    invertTree(root.left);
    invertTree(root.right);
    return root;
  }
}

void main() {
  Solution solution = Solution();
}
