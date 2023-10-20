// Definition for a binary tree node.
import 'dart:math';

import 'tree_node.dart';

void main(List<String> args) {
  // var p = [1,2], q = [1,null,2];
  TreeNode first = TreeNode(1);
  first.left = TreeNode(2);
  TreeNode sec = TreeNode(1);
  sec.right = TreeNode(2);

  print(Solution().isSameTree(first, sec));
}

class Solution {
  bool isSameTree(TreeNode? p, TreeNode? q) {
    //both are null
    if (p == null && q == null) {
      return true;
    } else if (p == null || q == null) {
      return false;
    }

    // checking recursively if left,right and val is same
    return (p.val == q.val &&
        isSameTree(p.left, q.left) &&
        isSameTree(p.right, q.right));
  }
}
