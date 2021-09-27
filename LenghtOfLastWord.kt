package com.example.lib

import java.lang.StringBuilder
import java.util.*

/*

Given a string s consisting of some words separated by some number of spaces, return the length of the last word in the string.

A word is a maximal substring consisting of non-space characters only.



Example 1:

Input: s = "Hello World"
Output: 5
Explanation: The last word is "World" with length 5.
Example 2:

Input: s = "   fly me   to   the moon  "
Output: 4
Explanation: The last word is "moon" with length 4.
Example 3:

Input: s = "luffy is still joyboy"
Output: 6
Explanation: The last word is "joyboy" with length 6.
*/

fun main(args:Array<String>){

    var result= lengthOfLastWord("   fly me   to   the moon  ")
        printResult("Length of last word",result.toString())
}

//Binary Search
fun lengthOfLastWord(s: String): Int {
    var result =0
    for(i in s.length-1 downTo   0) {
        if ((s[i].toString() == " " && result == 0)) continue

        if (s[i].toString() == " " && result != 0) break
        result++
    }
    return result
    }