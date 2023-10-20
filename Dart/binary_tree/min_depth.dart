import 'dart:math';

import 'tree_node.dart';
// Input: root = [3,9,20,null,null,15,7]
// Output: 2
// Example 2:

// Input: root = [2,null,3,null,4,null,5,null,6]
// Output: 5

// Input: root = [1,2,3,4,5]
// Output: 5

void main(List<String> args) {
  print(Solution().minDepth(
      TreeNode.fromList([1, 0, 3, 0, 5, 0, 7, 0, 9, 0, 11, 0, 13, 0, 15])));

  // [1, null, 3, null, 5, null, 7, null, 9, null, 11, null, 13, null, 15]
}

class Solution {
  int minDepth(TreeNode? root) {
    if (root == null) {
      return 0;
    } else if ((root.left == null && root.right == null)) {
      return 1;
    } else if (root.left != null && root.right != null) {
      return 1 + min(minDepth(root.left), minDepth(root.right));
    } else if (root.left != null) {
      return 1 + minDepth(root.left);
    } else {
      return 1 + minDepth(root.right);
    }
  }
}
