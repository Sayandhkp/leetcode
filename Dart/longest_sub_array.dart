void main(List<String> args) {
  var result = Solution().longestSubarray([0, 1, 1, 1, 0, 0, 1, 1, 0, 1]);
  print("RESULT==$result");
}

class Solution {
  int longestSubarray(List<int> nums) {
    int result = 0;

    int i = 0;
    int j = 0;
    int n = nums.length;
    int c0 = 0;

    while (j < n) {
      c0 += (nums[j] == 0) ? 1 : 0;
      while (c0 > 1) {
        c0 -= (nums[i] == 0) ? 1 : 0;

        i++;
      }
      if (j - i > result) {
        result = j - i;
      }

      j++;
    }

    return result;
  }
}
