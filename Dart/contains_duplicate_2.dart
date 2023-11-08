// Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.

// Example 1:

// Input: nums = [1,2,3,1], k = 3
// Output: true
// Example 2:

// Input: nums = [1,0,1,1], k = 1
// Output: true
// Example 3:

// Input: nums = [1,2,3,1,2,3], k = 2
// Output: false

import 'dart:math';

void main(List<String> args) {
  print(Solution1().containsNearbyDuplicate([1, 2, 3, 1], 3));
  print(Solution1().containsNearbyDuplicate([1, 0, 1, 1], 2));

  print(Solution1().containsNearbyDuplicate([1, 2, 3, 1, 2, 3], 2));
  print(Solution1().containsNearbyDuplicate([1, 0, 1, 1], 1));
}

class Solution {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    for (int i = 0; i < nums.length - 1; i++) {
      var j = min(i + k, nums.length - 1);
      while (j > i) {
        if (nums[i] == nums[j]) {
          return true;
        }
        j--;
      }
    }
    return false;
  }
}

class Solution1 {
  bool containsNearbyDuplicate(List<int> nums, int k) {
    Map<int, int> map = {};

    for (int i = 0; i < nums.length; i++) {
      if (map.containsKey(nums[i])) {
        if ((map[nums[i]]! - i).abs() <= k) return true;
      }
      map[nums[i]] = i;
    }
    return false;
  }
}
