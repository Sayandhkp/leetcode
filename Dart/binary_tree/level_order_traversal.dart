// Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).

// Example 1:

// Input: root = [3,9,20,null,null,15,7]
// Output: [[3],[9,20],[15,7]]
// Example 2:

// Input: root = [1]
// Output: [[1]]
// Example 3:

// Input: root = []
// Output: []

import 'dart:math';

import 'tree_node.dart';

void main(List<String> args) {
  // TreeNode node = TreeNode(3, TreeNode(9, TreeNode(null), TreeNode(null)),
  //     TreeNode(20, TreeNode(15), TreeNode(7)));
  // TreeNode node = TreeNode(
  //     1,
  //     TreeNode(
  //         2, TreeNode(4, TreeNode(8), TreeNode(9)), TreeNode(5, TreeNode(10))),
  //     TreeNode(3, TreeNode(6), TreeNode(7)));
  TreeNode node = TreeNode(
      1,
      TreeNode(
          2,
          TreeNode(4, TreeNode(8, TreeNode(16), TreeNode(17)), TreeNode(9)),
          TreeNode(5, TreeNode(10), TreeNode(11))),
      TreeNode(3, TreeNode(6, TreeNode(12), TreeNode(13)),
          TreeNode(7, TreeNode(14), TreeNode(15))));
  print(Solution().levelOrder(node));
}

class Solution {
  List<List<int>> levelOrder(TreeNode? root) {
    List<List<int>> _result = [];
    if (root == null)
      return _result;
    else if (root.right == null && root.right == null) {
      _result.add([root.val!]);
    } else {
      var length = findLength(root);

      var currentLevel = 0;
      TreeNode? _tempNode = TreeNode(root.val, root.left, root.right);
      List<int> child = [];
      while (currentLevel < length - 1) {
        if (currentLevel == 0) {
          _result.add([root.val!]);
          if (root.left != null) child.add(root.left!.val!);
          if (root.right != null) child.add(root.right!.val!);
          _result.add(child);
          child = [];
          currentLevel++;
        } else if (_tempNode?.left != null || _tempNode?.right != null) {
          if (_tempNode?.left != null)
            child.addAll(getChildList(_tempNode!.left!));
          if (_tempNode?.right != null)
            child.addAll(getChildList(_tempNode!.right!));

          _result.add(child);
          child = [];
          _tempNode?.left = _tempNode?.right = null;
          currentLevel++;
        } else if (root.right != null && _tempNode != root.right) {
          _tempNode = root.left == null || root.left == _tempNode
              ? root.right!
              : root.left;
        }
      }
    }

    return _result;
  }

  List<int> getChildList(TreeNode root) {
    List<int> child = [];
    if (root.left?.val != null) child.add(root.left!.val!);
    if (root.right?.val != null) child.add(root.right!.val!);
    return child;
  }

  findLength(TreeNode? root) {
    if (root == null) {
      return 0;
    } else if (root.left == null && root.right == null) {
      return 1;
    } else if (root.left != null && root.right != null) {
      return 1 + max(findLength(root.left), findLength(root.right));
    } else if (root.left != null) {
      return 1 + findLength(root.left);
    } else {
      return 1 + findLength(root.right);
    }
  }
}
