// Given two strings s and t, return true if they are equal when both are typed into empty text editors. '#' means a backspace character.

// Note that after backspacing an empty text, the text will continue empty.

// Example 1:

// Input: s = "ab#c", t = "ad#c"
// Output: true
// Explanation: Both s and t become "ac".
// Example 2:

// Input: s = "ab##", t = "c#d#"
// Output: true
// Explanation: Both s and t become "".
// Example 3:

// Input: s = "a#c", t = "b"
// Output: false
// Explanation: s becomes "c" while t becomes "b".

void main(List<String> args) {
  Solution().backspaceCompare("ab##", "c#d#");
  Solution().backspaceCompare("ab#c", "ad#c");
}

class Solution {
  bool backspaceCompare(String s, String t) {
    String s1 = '';
    String t1 = '';
    var i = 0;
    while (i < t.length || i < s.length) {
      if (i < s.length) {
        if (s[i] != "#") {
          s1 += s[i];
        } else {
          if (s1.length > 1) {
            s1 = s1.replaceRange(s1.length - 1, s1.length, '');
            print(s1);
          } else {
            s1 = '';
          }
        }
      }
      if (i < t.length) {
        if (t[i] != "#") {
          t1 += t[i];
        } else {
          if (t1.length > 1) {
            t1 = t1.replaceRange(t1.length - 1, t1.length, '');
          } else {
            t1 = '';
          }
        }
      }
      i++;
    }

    return s1 == t1;
  }
}
