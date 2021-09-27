package com.example.lib

import java.lang.StringBuilder
import java.util.*

/*
Given a non-negative integer x, compute and return the square root of x.

Since the return type is an integer, the decimal digits are truncated, and only the integer part of the result is returned.

Note: You are not allowed to use any built-in exponent function or operator, such as pow(x, 0.5) or x ** 0.5.



Example 1:

Input: x = 4
Output: 2
Example 2:

Input: x = 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
*/

fun main(args:Array<String>){

        var result = mySqrt(2000000000)
        printResult("Square Root of 2000000000", result.toString())
}


//Using Binary Search
fun mySqrt(x: Int): Int {
    var ans=0
    if(x!=0){
        var start:Long=0
        var end:Long=x.toLong()
        while (start<=end){
            var mid:Long=(start+end)/2

            if(mid*mid<x){
                start=mid+1
                ans=mid.toInt()

            }else if(mid*mid>x){
                end=mid-1
            }else{
                ans=mid.toInt()
                break

            }
        }
    }
    return ans
}
