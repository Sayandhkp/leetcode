// Given an unsorted array of integers nums, return the length of the longest consecutive elements sequence.

// You must write an algorithm that runs in O(n) time.

// Example 1:

// Input: nums = [100,4,200,1,3,2]
// Output: 4
// Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
// Example 2:

// Input: nums = [0,3,7,2,5,8,4,6,0,1]
// Output: 9

// Constraints:

// 0 <= nums.length <= 105
// -109 <= nums[i] <= 109

import 'dart:math';

void main(List<String> args) {
  print(Solution().longestConsecutive([1, 2, 0, 1]));
  print(Solution().longestConsecutive([0, 3, 7, 2, 5, 8, 4, 6, 0, 1]));
  print(Solution().longestConsecutive([100, 4, 200, 1, 3, 2]));
}

class Solution {
  int longestConsecutive(List<int> nums) {
    int maxSequence = 1;
    if (nums.isEmpty) return 0;
    if (nums.length == 1) return 1;

    nums.sort((a, b) => a.compareTo(b));
    int temSequence = 1;
    for (int i = 1; i < nums.length; i++) {
      if (nums[i] - nums[i - 1] == 1) {
        temSequence++;
      } else if (nums[i] == nums[i - 1]) {
        continue;
      } else {
        maxSequence = max(temSequence, maxSequence);
        temSequence = 1;
      }
    }

    return max(temSequence, maxSequence);
  }
}
