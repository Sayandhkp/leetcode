// Given two strings ransomNote and magazine, return true if ransomNote can be constructed by using the letters from magazine and false otherwise.

// Each letter in magazine can only be used once in ransomNote.

// Example 1:

// Input: ransomNote = "a", magazine = "b"
// Output: false
// Example 2:

// Input: ransomNote = "aa", magazine = "ab"
// Output: false
// Example 3:

// Input: ransomNote = "aa", magazine = "aab"
// Output: true

// Constraints:

// 1 <= ransomNote.length, magazine.length <= 105
// ransomNote and magazine consist of lowercase English letters.

void main(List<String> args) {}

class Solution {
  bool canConstruct(String ransomNote, String magazine) {
    if (ransomNote.length > magazine.length) {
      return false;
    } else if (ransomNote == magazine) {
      return true;
    } else if (ransomNote == "") {
      return true;
    }
    Map<String, int> map = {};
    for (int i = 0; i < magazine.length; i++) {
      if (map.containsKey(magazine[i])) {
        map[magazine[i]] = map[magazine[i]]! + 1;
      } else {
        map[magazine[i]] = 1;
      }
    }

    for (int j = 0; j < ransomNote.length; j++) {
      if (map.containsKey(ransomNote[j]) && map[ransomNote[j]]! > 0) {
        map[ransomNote[j]] = map[ransomNote[j]]! - 1;
      } else {
        return false;
      }
    }
    return true;
  }
}
