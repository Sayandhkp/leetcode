// You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

// Return true if you can reach the last index, or false otherwise.

// Example 1:

// Input: nums = [2,3,1,1,4]
// Output: true
// Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
// Example 2:

// Input: nums = [3,2,1,0,4]
// Output: false
// Explanation: You will always arrive at index 3 no matter what. Its maximum jump length is 0, which makes it impossible to reach the last index.

void main(List<String> args) {
  print(Solution().canJump([3, 2, 1, 0, 4]));
  print(Solution().canJump([2, 3, 1, 1, 4]));
}

class Solution {
  // Greedy algorithm
  bool canJump(List<int> nums) {
    int goal = nums.length - 1;

    for (int i = goal; i >= 0; i--) {
      //Check whether i + nums[i] greater than or equal to goal - Yes -> Goal can set to i
      if (i + nums[i] >= goal) {
        goal = i;
        print(goal);
      }
    }
    return goal == 0;
  }
}
