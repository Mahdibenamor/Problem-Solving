
class TreeNode {
  val: number
  left: TreeNode | null
  right: TreeNode | null
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = (val === undefined ? 0 : val)
    this.left = (left === undefined ? null : left)
    this.right = (right === undefined ? null : right)
  }
}


function goodNodes(root: TreeNode | null): number {
  let result = 0;
  let max = -10001;
  result = dfs(root, max);

  function dfs(node: TreeNode | null, max: number): number {
    if (node == null) {
      return 0;
    }
    if (node.val >= max) {

      return 1 + dfs(node.left, Math.max(node.val, max)) + dfs(node.right, Math.max(node.val, max))
    }
    return dfs(node.left, Math.max(node.val, max)) + dfs(node.right, Math.max(node.val, max))
  }
  return result;
};