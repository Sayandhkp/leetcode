package com.example.lib

import java.lang.StringBuilder
import java.util.*

/*
Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.

You must write an algorithm with O(log n) runtime complexity.



Example 1:

Input: nums = [1,3,5,6], target = 5
Output: 2
Example 2:

Input: nums = [1,3,5,6], target = 2
Output: 1
Example 3:

Input: nums = [1,3,5,6], target = 7
Output: 4
Example 4:

Input: nums = [1,3,5,6], target = 0
Output: 0
Example 5:

Input: nums = [1], target = 0
Output: 0
*/

fun main(args:Array<String>){

    var result= searchInsert(intArrayOf(1,3,5,6),5)
        printResult("searchInsert",result.toString())
}

//Binary Search
fun searchInsert(nums: IntArray, target: Int): Int {
    var start=0
    var end=nums.size-1

    while (start<=end){
        var mid=(start+end)/2
        if (nums[mid]>target){
            end=mid-1
        }else if(nums[mid]<target){
            start=mid+1
        }else{
            return mid
        }
    }
    return start
}