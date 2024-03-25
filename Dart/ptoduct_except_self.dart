// Given an integer array nums, return an array answer such that answer[i] is equal to the product of all the elements of nums except nums[i].

// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// You must write an algorithm that runs in O(n) time and without using the division operation.

// Example 1:

// Input: nums = [1,2,3,4]
// Output: [24,12,8,6]
// Example 2:

// Input: nums = [-1,1,0,-3,3]
// Output: [0,0,9,0,0]

// Constraints:

// 2 <= nums.length <= 105
// -30 <= nums[i] <= 30
// The product of any prefix or suffix of nums is guaranteed to fit in a 32-bit integer.

// Follow up: Can you solve the problem in O(1) extra space complexity? (The output array does not count as extra space for space complexity analysis.)

void main(List<String> args) {
  Solution().productExceptSelf([2, 3, 4, 5]);
  Solution().productExceptSelf([1, 2, 3, 4]);
}

class Solution {
  List<int> productExceptSelf(List<int> nums) {
    List<int> result = List.filled(nums.length, 1);

    var temp = nums[0];
    for (int i = 1; i < nums.length; i++) {
      result[i] *= temp;
      temp = temp * nums[i];
    }
    temp = nums[nums.length - 1];

    for (int i = nums.length - 2; i >= 0; i--) {
      result[i] *= temp;
      temp = nums[i] * temp;
    }

    return result;
  }
}
