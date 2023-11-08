// Given an input string s, reverse the order of the words.

// A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

// Return a string of the words in reverse order concatenated by a single space.

// Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

// Example 1:

// Input: s = "the sky is blue"
// Output: "blue is sky the"
// Example 2:

// Input: s = "  hello world  "
// Output: "world hello"
// Explanation: Your reversed string should not contain leading or trailing spaces.
// Example 3:

// Input: s = "a good   example"
// Output: "example good a"
// Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

// Constraints:

// 1 <= s.length <= 104
// s contains English letters (upper-case and lower-case), digits, and spaces ' '.
// There is at least one word in s.

void main(List<String> args) {
  // print(Solution().reverseWords("  hello world  "));
  print(Solution().reverseWords1("a good   example"));
  // print(Solution().reverseWords("the sky is blue"));
}

class Solution {
  String reverseWords(String s) {
    s = s.trim();
    var split = s.split(" ")..removeWhere((element) => element == "");
    var result = "";
    for (int i = split.length - 1; i >= 0; i--) {
      result += split[i];
      if (i != 0) {
        result += " ";
      }
    }
    return result;
  }

  String reverseWords1(String s) {
    var result;
    var word;
    s = s.trim();
    for (int i = 0; i < s.length; i++) {
      if (s[i] != " ") word == null ? word = s[i] : word += s[i];
      if ((s[i] == " " && s[i - 1] != " ") || i == s.length - 1) {
        result = result == null ? "$word" : "$word $result";
        word = "";
      }
    }
    return result;
  }
}
