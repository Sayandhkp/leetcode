// Given an array nums of size n, return the majority element.

// The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

// Example 1:

// Input: nums = [3,2,3]
// Output: 3
// Example 2:

// Input: nums = [2,2,1,1,1,2,2]
// Output: 2

// Constraints:

// n == nums.length
// 1 <= n <= 5 * 104
// -109 <= nums[i] <= 109

// Follow-up: Could you solve the problem in linear time and in O(1) space?

void main(List<String> args) {
  // Solution().majorityElement([3, 2, 3]);
  // Solution().majorityElement([2, 2, 1, 1, 1, 2, 2]);
  // Solution().majorityElement([2]);
  // print(Solution().majorityElement([3, 3, 4]));
  print(Solution().majorityElement([
    12,
    52,
    12,
    70,
    12,
    61,
    12,
    12,
    50,
    72,
    82,
    12,
    11,
    25,
    28,
    43,
    40,
    12,
    12,
    53,
    12,
    12,
    98,
    12,
    12,
    92,
    81,
    2,
    12,
    15,
    40,
    12,
    12,
    9,
    12,
    31,
    12,
    12,
    12,
    12,
    77,
    12,
    12,
    50,
    12,
    12,
    12,
    93,
    41,
    92,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    12,
    37,
    48,
    14,
    12,
    70,
    82,
    12,
    80,
    12,
    12,
    12,
    12,
    56,
    30,
    12,
    8,
    12,
    50,
    12,
    20,
    12,
    21,
    97,
    12,
    42,
    12,
    10,
    12,
    38,
    73,
    15,
    9,
    11,
    79,
    12,
    12,
    28,
    51,
    12,
    15,
    12
  ]));
}

class Solution {
  int majorityElement(List<int> nums) {
    var res = 0;

    Map<int, int> map = {};

    for (int i in nums) {
      if (map.containsKey(i)) {
        map[i] = map[i]! + 1;
      } else {
        map[i] = 1;
      }
      if (map[i]! > nums.length / 2) {
        return i;
      }
    }

    return res;
  }
}
