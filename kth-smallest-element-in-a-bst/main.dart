import 'dart:collection';

class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  int kthSmallest(TreeNode? root, int k) {
    Queue<TreeNode> stack = Queue();
    TreeNode? currentNode = root;
    int n = 0;
    while (currentNode != null && stack != null) {
      while (currentNode != null) {
        stack.add(currentNode);
        currentNode = currentNode.left;
      }
      currentNode = stack.removeLast();
      n++;
      if (n == k) {
        return currentNode.val;
      }
      currentNode = currentNode.right;
    }
    return 0;
  }
}

void main() {
  Solution solution = Solution();
  TreeNode treeNode2 = TreeNode(2, null, null);
  TreeNode treeNode1 = TreeNode(1, null, treeNode2);
  TreeNode treeNode4 = TreeNode(4, null, null);
  TreeNode treeNode3 = TreeNode(3, treeNode1, treeNode4);
  print(solution.kthSmallest(treeNode3, 1));
}
