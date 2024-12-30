class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  TreeNode? buildTree(List<int> preorder, List<int> inorder) {
    if (preorder.isEmpty || inorder.isEmpty) {
      return null;
    }
    TreeNode root = TreeNode();
    root.val = preorder.first;
    int mid = inorder.indexOf(preorder.first);
    root.left =
        buildTree(preorder.sublist(1, mid + 1), inorder.sublist(0, mid));
    root.right = buildTree(preorder.sublist(mid + 1), inorder.sublist(mid + 1));
    return root;
  }
}

void main() {
  Solution solution = Solution();
}
