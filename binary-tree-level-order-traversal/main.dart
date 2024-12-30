class TreeNode {
  int val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> generations = List.empty(growable: true);
    List<TreeNode?> currentGeneration = [root];
    List<TreeNode?> nextGeneration = [];
    List<int> currentGenerationResult = List.empty(growable: true);
    if (root == null) {
      return [];
    }
    while (currentGeneration.isNotEmpty) {
      TreeNode? currentNode = currentGeneration.removeAt(0);

      if (currentNode != null) {
        currentGenerationResult.add(currentNode.val);
        if (currentNode.left != null) {
          nextGeneration.add(currentNode.left);
        }
        if (currentNode.right != null) {
          nextGeneration.add(currentNode.right);
        }
      }

      if (currentGeneration.isEmpty) {
        generations.add(currentGenerationResult);
        currentGenerationResult = [];
        if (nextGeneration.isNotEmpty) {
          currentGeneration = nextGeneration;
          nextGeneration = [];
        }
      }
    }
    return generations;
  }
}

void main() {
  Solution solution = Solution();
}
