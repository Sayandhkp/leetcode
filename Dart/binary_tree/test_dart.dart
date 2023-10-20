// Write a function that takes three arguments, 2 arrays (a and b) and 1 integer (c) then returns one array (d) which is created by inserting all elements in b into a at indexes which are spaced by the integer value c.

// Consider all possible corner cases and print out the final array (d).
// e.g
// Example Input
// a = [“a”, “b”, “c”, “d”, “e”, “f”]
// b = [“1”, “2", “3”]
// c = 2
// Example Output:
// d = [“a”, “b”, “1", “c”, “d”, “2”, “e”, “f”, “3"]

void main(List<String> args) {
  var result =
      Solution().mergeArray(["a", "b", "c", "d", "e", "f"], ["1", "2", "3"], 0);
  print(result);
}

class Solution {
  List<String> mergeArray(List<String> a, List<String> b, int c) {
    List<String> result = [];
    List<String> tempArray = [];
    tempArray.addAll(b);
    int index = 0;
    if (c == 0) {
      result.addAll(b);
      result.addAll(a);
      return result;
    }
    for (int i = 0; i < a.length; i++) {
      result.add(a[i]);
      if (c == 1 && index < b.length) {
        result.add(b[index]);
        tempArray.remove(b[index]);
        index++;
      } else if (i != 0 && (i + 1) % c == 0 && index < b.length) {
        result.add(b[index]);
        tempArray.remove(b[index]);
        index++;
      }
    }
    result.addAll(tempArray);

    return result;
  }
}
