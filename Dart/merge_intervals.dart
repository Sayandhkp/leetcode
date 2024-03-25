// Given an array of intervals where intervals[i] = [starti, endi], merge all overlapping intervals, and return an array of the non-overlapping intervals that cover all the intervals in the input.

// Example 1:

// Input: intervals = [[1,3],[2,6],[8,10],[15,18]]
// Output: [[1,6],[8,10],[15,18]]
// Explanation: Since intervals [1,3] and [2,6] overlap, merge them into [1,6].
// Example 2:

// Input: intervals = [[1,4],[4,5]]
// Output: [[1,5]]
// Explanation: Intervals [1,4] and [4,5] are considered overlapping.

import 'dart:math';

void main(List<String> args) {
  Solution().merge([
    [1, 3],
    [2, 6],
    [8, 10],
    [15, 18]
  ]);

  Solution().merge([
    [1, 4],
    [4, 5]
  ]);

  Solution().merge([
    [1, 4],
    [0, 4]
  ]);

  Solution().merge([
    [1, 4],
    [0, 1]
  ]);

  Solution().merge([
    [1, 4],
    [0, 0]
  ]);
}

class Solution {
  List<List<int>> merge(List<List<int>> intervals) {
    if (intervals.length <= 1) return intervals;
    List<List<int>> result = [];

    intervals.sort((a, b) => a[0].compareTo(b[0]));

    int i = 0;
    int j = 1;

    while (i < intervals.length) {
      var interval = intervals[i];

      while (j < intervals.length) {
        if (intervals[i][1] >= intervals[j][0] &&
            intervals[j][0] <= intervals[j][0]) {
          interval[1] = max(intervals[j][1], interval[1]);

          interval[0] = min(intervals[j][0], interval[0]);
          j++;
          if (j == intervals.length) {
            result.add(interval);
          }
        } else {
          result.add(interval);
          i = j;
          j = i + 1;
          if (j >= intervals.length) {
            result.add(intervals.last);
          }
        }
        interval = intervals[i];
      }

      i++;
    }
    print(result);
    return result;
  }
}
