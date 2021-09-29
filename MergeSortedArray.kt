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

    var result = merge(intArrayOf(1,2,3,0,0,0),5, intArrayOf(2,5,6),1)
    printResult("Merge Sorted Array ", result.toString())
}

fun merge(nums1: IntArray, m: Int, nums2: IntArray, n: Int): Unit {

    if(m==0){
        for (i  in nums2.indices){
            nums1[i]=nums2[i]
        }
    }
    var i=0
    var j=0
    var res=0
    var pointer=0
    if (m != 0 && n != 0) {

            while (i<m&&j<n){
                if (nums1[i]==0){
                    nums1[res]=nums2[j]
                    j++
                    continue
                }
                if(nums1[i] < nums2[j]) {
                    i++
                }else if (nums1[i] > nums2[j]){
                    var x=nums1[res]
                    nums1[res] = nums2[j]

                    i++
                    j++

                    if(nums1[i]<x){
                        nums1[m+pointer]=x
                    }else{
                        x+=nums1[i]
                        nums1[i]=x-nums1[i]
                        nums1[m+pointer]=x-nums1[i]
                    }
                    pointer++
                }else {
                    nums1[res] = nums1[i]
                    res++
                    val x=nums1[res]
                    nums1[res] = nums2[j]
                    nums2[j]=x
                    i += 2
                }
                res++
            }
        if(nums1.last()< nums1[nums1.size-2]){
            nums1[nums1.size-2]+=nums1[nums1.size-1]
            nums1[nums1.size-1]=nums1[nums1.size-2]-nums1[nums1.size-1]
            nums1[nums1.size-2]=nums1[nums1.size-2]-nums1[nums1.size-1]

        }

        println(nums1)
    }
}
