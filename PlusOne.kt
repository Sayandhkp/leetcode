package com.example.lib

import java.lang.StringBuilder
import java.util.*
import kotlin.collections.ArrayList

/*
You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.

Increment the large integer by one and return the resulting array of digits.



Example 1:

Input: digits = [1,2,3]
Output: [1,2,4]
Explanation: The array represents the integer 123.
Incrementing by one gives 123 + 1 = 124.
Thus, the result should be [1,2,4].
Example 2:

Input: digits = [4,3,2,1]
Output: [4,3,2,2]
Explanation: The array represents the integer 4321.
Incrementing by one gives 4321 + 1 = 4322.
Thus, the result should be [4,3,2,2].
Example 3:

Input: digits = [0]
Output: [1]
Explanation: The array represents the integer 0.
Incrementing by one gives 0 + 1 = 1.
Thus, the result should be [1].
Example 4:

Input: digits = [9]
Output: [1,0]
Explanation: The array represents the integer 9.
Incrementing by one gives 9 + 1 = 10.
Thus, the result should be [1,0].
*/

fun main(args:Array<String>){

    var result= plusOne(intArrayOf(3,2,3,9),)
        printResult("Plus One",result.contentToString())
}

fun plusOne(digits: IntArray): IntArray {
    var carry=1
    for (i in digits.size-1 downTo 0){
       digits[i]+=carry
        carry=digits[i]/10
        if(carry==0){
            break
        }
        digits[i]=digits[i]%10
    }
    if (carry==1){
        var result=IntArray(digits.size+1)
        result[0]=carry
        return result
    }
    return digits
//
//    if(digits[digits.size-1]!=9){
//        digits[digits.size-1]=digits[digits.size-1]+1
//        return digits
//    }else{
//        var pos=digits.size-1
//        var poniter=digits[pos]
//        while (poniter==9){
//
//            digits[pos]=0
//
//            if(pos==0&& poniter==9){
//
//                result.add(1)
//                result.addAll(digits.toList())
//                return result.toIntArray()
//            }else {
//                pos--
//                poniter = digits[pos]
//            }
//        }
//        digits[pos]=digits[pos]+1
//    }
//    return digits
}