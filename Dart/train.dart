// Given arrival and departure times of all trains that
// reach a railway station, the task is to find the minimum number of
// platforms required for the railway station so that no train waits.

// Input: arr[] = {9:00, 9:40, 9:50, 11:00, 15:00, 18:00}

// dep[] =        {21:00, 12:00, 11:20, 11:30, 19:00, 20:00}

// Input: arr[] = {9:00, 9:40, 9:50, 11:00, 15:00, 18:00}

// dep[] =        {9:10, 12:00, 11:20, 11:30, 19:00, 20:00}

import 'dart:math';

void main() {
  Solution().findChar(
      [900, 940, 950, 1100, 1500, 1910], [945, 1200, 1000, 1130, 1900, 2000]);

  Solution().findChar(
      [900, 940, 950, 1100, 1500, 1800], [910, 1200, 1120, 1130, 1900, 2000]);
}

// [900, 940, 950, 1100, 1500, 2000],
// [945, 1200, 1000, 1130, 1900, 2000]);

//[900, 940, 950, 1100, 1500, 1910],
//[945, 1200, 1000, 1130, 1900, 2000]);


// [41 1616 297 2042 1013 987 2050 525 636 109 ]
// [ 2275 2076 1580 2144 1231 1672 2137 1016 2234 1043 ]
class Solution {
  int findChar(List<int> arrival, List<int> departure) {
    int minPlatform = 1;

    var size = arrival.length;
    if (size == 0) {
      return 0;
    }
    int i = 0;
    int j = 1;
    while (j < size && i < size) {
      if (arrival[j] < departure[i]) {
        minPlatform++;
        j++;
      } else {
        i++;
        j++;
      }
      while (j - i > 1 && j < size && i < size) {
        if (arrival[j] < departure[i]) {
          i++;
        } else {
          j++;
        }
      }
    }
    print(minPlatform);
    return minPlatform;
  }
}
