class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    TreeNode? currentNode = root;
    while (currentNode != null) {
      if (currentNode.val == p.val || currentNode.val == q.val) {
        return currentNode;
      } else if (p.val > currentNode.val && q.val < currentNode.val) {
        return currentNode;
      } else if (p.val < currentNode.val && q.val > currentNode.val) {
        return currentNode;
      } else if (p.val > currentNode.val && q.val > currentNode.val) {
        currentNode = currentNode.right;
      } else if (p.val < currentNode.val && q.val < currentNode.val) {
        currentNode = currentNode.left;
      }
    }
    return root;
  }
}

void main() {
  Solution solution = Solution();
}
