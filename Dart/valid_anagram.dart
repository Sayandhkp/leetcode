// Given two strings s and t, return true if t is an anagram of s, and false otherwise.

// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Example 1:

// Input: s = "anagram", t = "nagaram"
// Output: true
// Example 2:

// Input: s = "rat", t = "car"
// Output: false

// Constraints:

// 1 <= s.length, t.length <= 5 * 104
// s and t consist of lowercase English letters.

// Follow up: What if the inputs contain Unicode characters? How would you adapt your solution to such a case?

void main(List<String> args) {
  print(Solution().isAnagram("anagram", "nagaram"));
}

class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) return false;

    Map<String, int> map = {};

    for (int i = 0; i < s.length; i++) {
      if (map.containsKey(s[i])) {
        map[s[i]] = map[s[i]]! + 1;
      } else {
        map[s[i]] = 1;
      }
    }

    for (int j = 0; j < t.length; j++) {
      if (!map.containsKey(t[j]) || map[t[j]]! < 1) {
        return false;
      } else {
        map[t[j]] = map[t[j]]! - 1;
      }
    }

    return true;
  }
}
