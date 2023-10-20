// Given a signed 32-bit integer x, return x with its digits reversed. If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

// Example 1:

// Input: x = 123
// Output: 321
// Example 2:

// Input: x = -123
// Output: -321
// Example 3:

// Input: x = 120
// Output: 21

void main(List<String> args) {
  print(Solution().reverse(-120));
}

class Solution {
  int reverse(int x) {
    if(x==0) return 0;
    int max = 2147483648 - 1;
    int min = -2147483648;

    var result = "";
    var temp = x.abs();
    while (temp > 0) {
      result += "${temp % 10}";
      temp = temp ~/ 10;
    }

    int finalResult = x > 0 ? int.parse(result) : 0 - int.parse(result);

    return finalResult < min || finalResult > max ? 0 : finalResult;
  }
}
