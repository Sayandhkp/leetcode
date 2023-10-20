// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

// The overall run time complexity should be O(log (m+n)).

 

// Example 1:

// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000
// Explanation: merged array = [1,2,3] and median is 2.
// Example 2:

// Input: nums1 = [1,2], nums2 = [3,4]
// Output: 2.50000
// Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
 




void main(List<String> args) {
  print(Solution().findMedianSortedArrays([0, 0], [0, 0]));
}

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    if (nums1.length < nums2.length) {
      var temp = [...nums1];
      nums1 = nums2;
      nums2 = [...temp];
    }
    int x = nums1.length;
    int y = nums2.length;

    int i = 0;
    int j = 0;
    var resultArray = [];
    while (i < x || j < y) {
      if (j < y) {
        if (i < x && nums1[i] < nums2[j]) {
          while (i < x && nums1[i] < nums2[j]) {
            resultArray.add(nums1[i]);
            i++;
          }
        } else {
          if (i >= x) {
            resultArray.add(nums2[j]);
            j++;
          } else {
            while (j < y && nums2[j] <= nums1[i]) {
              resultArray.add(nums2[j]);
              j++;
            }
          }
        }
      } else {
        resultArray.add(nums1[i]);
        i++;
      }
    }
    if (resultArray.length % 2 != 0) {
      return resultArray[resultArray.length ~/ 2] / 1;
    } else {
      return (resultArray[resultArray.length ~/ 2] +
              resultArray[(resultArray.length ~/ 2) - 1]) /
          2;
    }
  }
}
