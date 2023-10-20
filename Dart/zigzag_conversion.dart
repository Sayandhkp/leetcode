// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

// P   A   H   N
// A P L S I I G
// Y   I   R
// And then read line by line: "PAHNAPLSIIGYIR"

// Write the code that will take a string and make this conversion given a number of rows:

// string convert(string s, int numRows);

// Example 1:

// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"
// Example 2:

// Input: s = "PAYPALISHIRING", numRows = 4
// Output: "PINALSIGYAHRPI"
// Explanation:
// P     I    N
// A   L S  I G
// Y A   H R
// P     I
// Example 3:

// Input: s = "A", numRows = 1
// Output: "A"

void main(List<String> args) {
  Solution().convert("AB", 1);
}

class Solution {
  String convert(String s, int numRows) {
    if (s.length <= numRows || numRows <= 1) {
      return s;
    }
    List map = List.filled(numRows, null);
    var temp = 0;
    var forward = true;
    for (int i = 0; i < s.length; i++) {
      map[temp] = "${map[temp] ?? ""}${s[i]}";
      if (temp == numRows - 1) {
        forward = false;
      } else if (temp == 0) {
        forward = true;
      }

      temp += forward ? 1 : -1;
    }

    return map.join('');
  }
}
