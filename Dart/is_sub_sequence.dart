// Given two strings s and t, return true if s is a subsequence of t, or false otherwise.

// A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

// Example 1:

// Input: s = "abc", t = "ahbgdc"
// Output: true
// Example 2:

// Input: s = "axc", t = "ahbgdc"
// Output: false

void main(List<String> args) {
  print(Solution().isSubsequence("abc", "ahbgdc"));
}

class Solution {
  bool isSubsequence(String s, String t) {
    var j = 0;

    if (s.length > t.length) {
      return false;
    } else if (s == t) {
      return true;
    } else if (s == "") {
      return true;
    }

    for (int i = 0; i < t.length; i++) {
      if (t[i] == s[j]) {
        j++;
      }
      if (j >= s.length) {
        break;
      }
    }

    return j == s.length;
  }
}
