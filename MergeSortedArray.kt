package com.example.lib

import kotlin.collections.ArrayList

/*
Every valid email consists of a local name and a domain name, separated by the '@' sign. Besides lowercase letters, the email may contain one or more '.' or '+'.

For example, in "alice@leetcode.com", "alice" is the local name, and "leetcode.com" is the domain name.
If you add periods '.' between some characters in the local name part of an email address, mail sent there will be forwarded to the same address without dots in the local name. Note that this rule does not apply to domain names.

For example, "alice.z@leetcode.com" and "alicez@leetcode.com" forward to the same email address.
If you add a plus '+' in the local name, everything after the first plus sign will be ignored. This allows certain emails to be filtered. Note that this rule does not apply to domain names.

For example, "m.y+name@email.com" will be forwarded to "my@email.com".
It is possible to use both of these rules at the same time.

Given an array of strings emails where we send one email to each email[i], return the number of different addresses that actually receive mails.



Example 1:

Input: emails = ["test.email+alex@leetcode.com","test.e.mail+bob.cathy@leetcode.com","testemail+david@lee.tcode.com"]
Output: 2
Explanation: "testemail@leetcode.com" and "testemail@lee.tcode.com" actually receive mails.
Example 2:

Input: emails = ["a@leetcode.com","b@leetcode.com","c@leetcode.com"]
Output: 3
*/

fun main(args:Array<String>){

//    merge1(intArrayOf(1,2,3,0,0,0),3, intArrayOf(2,5,6),3)
//    merge1(intArrayOf(1,2,3,0,0,0),3, intArrayOf(1,2,3),3)
//     merge1(intArrayOf(4,5,6,0,0,0),3, intArrayOf(1,2,3),3)
//     merge1(intArrayOf(-1,0,0,3,3,3,0,0,0),6, intArrayOf(1,2,2),3)
//   merge1(intArrayOf(2,0),1, intArrayOf(1),1)

    merge(intArrayOf(1,2,3,0,0,0),3, intArrayOf(2,5,6),3)
    merge(intArrayOf(1,2,3,0,0,0),3, intArrayOf(1,2,3),3)
    merge(intArrayOf(4,5,6,0,0,0),3, intArrayOf(1,2,3),3)
    merge(intArrayOf(-1,0,0,3,3,3,0,0,0),6, intArrayOf(1,2,2),3)
    merge(intArrayOf(2,0),1, intArrayOf(1),1)
}
fun merge1(nums1: IntArray, m: Int, nums2: IntArray, n: Int): Unit {

    if(m==0){
        for (i  in nums2.indices){
            nums1[i]=nums2[i]
        }
        return
    }
    if(n==0){
        return
    }
    var i=0
    var j=0
    nums1
    while (i<m+n){
        if (nums1[i]==0&&i>=m){
            nums1[i]=nums2[j]
            i++
            j++
        }else if(nums1[i]<=nums2[j]){
            i++
        }else{
            var x=nums1[i]
            nums1[i]=nums2[j]
            nums2[j]=x
            nums2.sort()
            i++

        }

    }
    println(nums1)
}

fun merge(nums1: IntArray, m: Int, nums2: IntArray, n: Int) {


    var totalSize=m+n-1
    var i=m-1
    var j=n-1

    while (totalSize>=0){
        var num1= if(i<0) Int.MIN_VALUE else nums1[i]
        var num2= if(j<0) Int.MIN_VALUE else nums2[j]


        nums1[totalSize] = if(num1>num2){
            --i
            num1

        }else{
            --j
            num2

        }
        --totalSize
    }
}



//
//fun merge2(nums1: IntArray, m: Int, nums2: IntArray, n: Int) {
//    var idx1 = m - 1
//    var idx2 = n - 1
//    var idx = m + n - 1
//
//    while (idx >= 0) {
//        val num1 = if (idx1 < 0) Int.MIN_VALUE else nums1[idx1]
//        val num2 = if (idx2 < 0) Int.MIN_VALUE else nums2[idx2]
//
//        nums1[idx] = if (num1 < num2) {
//            // to be careful with the order (of expressions) here
//            --idx2
//            num2
//        } else {
//            // to be careful with the order (of expressions) here
//            --idx1
//            num1
//        }
//        --idx
//    }
//}