// Given a string s representing a valid expression, implement a basic calculator to evaluate it, and return the result of the evaluation.

// Note: You are not allowed to use any built-in function which evaluates strings as mathematical expressions, such as eval().

// Example 1:

// Input: s = "1 + 1"
// Output: 2
// Example 2:

// Input: s = " 2-1 + 2 "
// Output: 3
// Example 3:

// Input: s = "(1+(4+5+2)-3)+(6+8)"
// Output: 23

void main(List<String> args) {
  print(Solution().calculate("(1+(4+5+2)-3)+(6+8)"));
  print(Solution().calculate(" 2-1 + 20 "));
  print(Solution().calculate("2147483647"));
  print(Solution().calculate("1-(     -2)"));
}

class Solution {
  int calculate(String s) {
    List<int> queue = [];
    int number = 0;
    int ans = 0;
    var sign = 1;
    var isLastSign = false;
    for (int i = 0; i < s.length; i++) {
      if (isNumeric(s[i])) {
        number = number * 10 + (int.parse(s[i]));
        isLastSign = false;
        continue;
      }
      if (s[i] == "-" || s[i] == "+") {
        var tempSi = s[i] == "-" ? -1 : 1;

        if (isLastSign) {
          tempSi = sign * tempSi;
        }

        sign = queue.isEmpty ? 1 : queue.removeLast();
        ans += sign * number;
        number = 0;
        isLastSign = true;
        queue.add(tempSi);
      } else if (s[i] == "(" || s[i] == ")") {
        sign = queue.isEmpty ? 1 : queue.removeLast();
        ans += sign * number;
        number = 0;
      }
    }
    sign = queue.isEmpty ? 1 : queue.removeLast();
    return ans + (sign * number);
  }

  isNumeric(string) => num.tryParse(string) != null;
}
