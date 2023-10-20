// Code

// Testcase
// Testcase
// Result

// 5. Longest Palindromic Substring
// Medium
// Topics
// Companies
// Hint
// Given a string s, return the longest
// palindromic

// substring
//  in s.

// Example 1:

// Input: s = "babad"
// Output: "bab"
// Explanation: "aba" is also a valid answer.
// Example 2:

// Input: s = "cbbd"
// Output: "bb"

void main(List<String> args) {
  Solution().longestPalindrome("ac");
}

class Solution {
  String longestPalindrome(String s) {
    var result = '';
    if (s.isEmpty) {
      return "";
    }
    if (s.length == 1) return s;

    int i = 0;
    int j = 1;

    var items = s.split("");
    var temp = [];
    while (i < items.length && j < items.length) {
      if (temp.isEmpty) {
        temp.add(items[i]);
        if (result.isEmpty) result = items[i];
      }
      temp.add(items[j]);
      if (isPalidrom(temp)) {
        if (temp.length > result.length) {
          result = temp.join("");
        }
      }
      if (j == items.length - 1) {
        i++;
        j = i;
        temp.clear();
      }

      j++;
    }
    print(result);
    return result;
  }

  bool isPalidrom(List<dynamic> temp) {
    print(temp);
    if (temp.length == 1) return true;
    for (int i = 0; i < temp.length / 2; i++) {
      if (temp[i] != temp[temp.length - 1 - i]) {
        return false;
      }
    }
    return true;
  }

  // String longestPalindrome1(String s) {
  //   String result = '';

  //   int i = 0;
  //   int j = s.length - 1;
  //   var index=[i,j];

  //   while (i < s.length) {
  //     if (s[i] != s[j]) {
  //       i++;
  //     }
  //   }

  //   return result;
  // }
}
