// Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.

// Example 1:

// Input: nums = [1,2,3,4,5,6,7], k = 3
// Output: [5,6,7,1,2,3,4]
// Explanation:
// rotate 1 steps to the right: [7,1,2,3,4,5,6]
// rotate 2 steps to the right: [6,7,1,2,3,4,5]
// rotate 3 steps to the right: [5,6,7,1,2,3,4]
// Example 2:

// Input: nums = [-1,-100,3,99], k = 2
// Output: [3,99,-1,-100]
// Explanation:
// rotate 1 steps to the right: [99,-1,-100,3]
// rotate 2 steps to the right: [3,99,-1,-100]

// Constraints:

// 1 <= nums.length <= 105
// -231 <= nums[i] <= 231 - 1
// 0 <= k <= 105

void main(List<String> args) {
  Solution().rotate([1, 2, 3, 4, 5, 6, 7], 3);
  Solution().rotate([1, 2], 5);
}

class Solution {
  void rotate(List<int> nums, int k) {
    if (k == 0 || nums.isEmpty) {
      return;
    }
    while (k > nums.length) {
      k = k - nums.length;
    }
    print(k);
    List<int> temp = [];
    List<int> temp2 = [];
    for (int i = nums.length - k; i < nums.length; i++) {
      temp.add(nums[i]);
    }
    for (int i = 0; i < nums.length - k; i++) {
      temp2.add(nums[i]);
    }

    nums.clear();
    nums.addAll(temp);
    nums.addAll(temp2);

    print(nums);
  }
}
