// Given an array of strings strs, group the anagrams together. You can return the answer in any order.

// An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.

// Example 1:

// Input: strs = ["eat","tea","tan","ate","nat","bat"]
// Output: [["bat"],["nat","tan"],["ate","eat","tea"]]
// Example 2:

// Input: strs = [""]
// Output: [[""]]
// Example 3:

// Input: strs = ["a"]
// Output: [["a"]]

// Constraints:

// 1 <= strs.length <= 104
// 0 <= strs[i].length <= 100
// strs[i] consists of lowercase English letters.

void main(List<String> args) {
  Solution().groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"]);
}

class Solution {
  List<List<String>> groupAnagrams(List<String> strs) {
    Map<String, List<String>> result1 = {};

    for (int i = 0; i < strs.length; i++) {
      var sorted = strs[i].split("")..sort((a, b) => a.compareTo(b));
      String sortedJoin = sorted.join("");
      if (result1.containsKey(sortedJoin)) {
        result1[sortedJoin] = result1[sortedJoin]!..add(strs[i]);
      } else {
        result1[sortedJoin] = [strs[i]];
      }
    }

    return result1.values.toList();

    List<List<String>> result = [];

    for (int j = 0; j < strs.length; j++) {
      var resultLength = result.length;
      var isAdded = false;
      for (int i = 0; i < resultLength; i++) {
        if (isAnagram(strs[j], result[i][0])) {
          result[i].add(strs[j]);
          isAdded = true;
          break;
        }
      }
      if (!isAdded) {
        result.add([strs[j]]);
      }
    }
    print(result);
    return result;
  }
}

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
