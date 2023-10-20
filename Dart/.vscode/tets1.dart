import 'dart:io';

void main(List<String> args) {
  
  print(Solution().numJewelsInStones("", "aAAbbbb"));
}

class Solution {
  int numJewelsInStones(String jewels, String stones) {
    int result = 0;
    String temp = "";
    for (int i = 0; i < jewels.length; i++) {
      if (!temp.contains(jewels[i])) {
        result += stones.split("").where((value) => value == jewels[i]).length;
      }
      temp += jewels[i];
    }
    return result;
  }
}
