// Given a pattern and a string s, find if s follows the same pattern.

// Here follow means a full match, such that there is a bijection between a letter in pattern and a non-empty word in s.

// Example 1:

// Input: pattern = "abba", s = "dog cat cat dog"
// Output: true
// Example 2:

// Input: pattern = "abba", s = "dog cat cat fish"
// Output: false
// Example 3:

// Input: pattern = "aaaa", s = "dog cat cat dog"
// Output: false

// Constraints:

// 1 <= pattern.length <= 300
// pattern contains only lower-case English letters.
// 1 <= s.length <= 3000
// s contains only lowercase English letters and spaces ' '.
// s does not contain any leading or trailing spaces.
// All the words in s are separated by a single space.

void main(List<String> args) {
  print(Solution().wordPattern("abba", "dog cat cat dog"));
  print(Solution().wordPattern("abba", "dog dog dog dog"));
}

class Solution {
  bool wordPattern(String pattern, String s) {
    var list = s.split(" ");

    if (list.length != pattern.length) return false;

    Map<String, String> map = {};

    for (int i = 0; i < list.length; i++) {
      if (map.containsKey(pattern[i])) {
        if (map[pattern[i]] != list[i]) {
          return false;
        }
      } else {
        if (map.containsValue(list[i])) {
          return false;
        }
        map[pattern[i]] = list[i];
      }
    }
    return true;
  }
}
