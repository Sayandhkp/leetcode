class TreeNode {
  int? val;
  TreeNode? left;
  TreeNode? right;
  TreeNode([this.val = 0, this.left, this.right]);

  static fromList(List<int?> list) {
    TreeNode? treeNode = _insertLevelOrder(list, 0);
    return treeNode;
  }

  static TreeNode? _insertLevelOrder(List<int?> arr, int i) {
    if (i >= arr.length || arr[i] == null) {
      return null;
    }

    TreeNode? root = TreeNode(arr[i]);
    print(i);

    // root.left = _insertLevelOrder(arr, 2 * i + 1);
    // if (root.left == null) {
    //   print("left completed==$i");
    // }
    root.right = _insertLevelOrder(arr, 2 * i + 2);

    return root;
  }

  static inOrder(TreeNode? root) {
    if (root != null) {
      inOrder(root.left);
      inOrder(root.right);
    }
  }
}

void main(List<String> args) {
  TreeNode.fromList([1, 2, 3, 4, 5]);
}
