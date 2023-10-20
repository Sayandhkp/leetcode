import 'dart:math';

void main(List<String> args) {
  print(Solution().minSubArrayLen(7, [2, 3, 1, 2, 4, 3]));
}

class Solution {
  int minSubArrayLen(int target, List<int> nums) {
    var result = 0x7fffffffffffffff;

    int j = 0;
    int n = nums.length;
    var sum = 0;

    for (int i = 0; i < nums.length; i++) {
      sum += nums[i];
      while (sum >= target) {
        result = min(i - j + 1, result);
        sum -= nums[j];
        j++;
      }
    }

    return result == 0x7fffffffffffffff ? 0 : result;
  }
}
