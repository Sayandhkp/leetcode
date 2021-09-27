package com.example.lib

import java.util.*


fun main(args:Array<String>){

    var result=MyClass().lengthOfLongestSubstring("aab")
    printResult("Longest Sub String",result.toString())


    var romanToInt=MyClass().romanToInt("MCMXCIV")
    printResult("ROMAN TO INT",romanToInt.toString())


    var list= arrayOf("caa","","a","acb")
    var longestCommonPref=MyClass().longestCommonPrefix(strs =list )
    printResult("longestCommonPref",longestCommonPref)

    MyClass().mergeTwoLists()

//    MyClass().mergeTwoLists()
}

class MyClass {
    fun lengthOfLongestSubstring(s: String): Int {
        var start = 0
        var end = 0
        var longestSubStringLength = 0
        val charArray = s.toCharArray()
        val length = charArray.size
        val chars = IntArray(128)
        Arrays.fill(chars, -1)
        while (end < length) {
            val c = charArray[end]
            if (chars[c.toInt()] >= 0 && chars[c.toInt()] >= start) {
                start = chars[c.toInt()] + 1
            }
            chars[c.toInt()] = end
            end++
            longestSubStringLength = Math.max(longestSubStringLength, end - start)
        }
        return longestSubStringLength
    }

    //Given a roman numeral, convert it to an integer.
    fun romanToInt(s: String): Int {
        var result=0
        var value=0
        var prev=0

        for (char:Char in s){
           when (char.toString()){
               "I"->value=1
               "V"->value=5
               "X"->value=10
               "L"->value=50
               "C"->value=100
               "D"->value=500
               "M"->value=1000
           }
            result+=value
            if (prev<value&&prev!=0){
                result-=(prev*2)
            }
            prev=value
        }

        return result
    }

    //longest of common prefix
    fun longestCommonPrefix(strs: Array<String>): String {
        var result=""

        if(strs.size==1) return strs[0]
        for (i in strs.indices){
            if(i>=strs.size-1) break

            var first=if(result.isBlank()) strs[i] else result
            var second=""
            if(i<strs.size-1) {
                 second = strs[i + 1]
            }
            var short= if(first.length<second.length) first else second
            result=""
            if(short.isBlank()) return ""
            for (index in short.indices){
                if(first[index]==second[index]){
                    result+=first[index]
                }else{
                    if (result=="") return  result
                    break

                }

            }

        }

        return result
    }



//    /**
//      Example:
     var li = ListNode(5)
     var v = li.`val`
//      Definition for singly-linked list.
      class ListNode(var `val`: Int) {
          var next: ListNode? = null
      }
//     */

    fun mergeTwoLists(): ListNode? {
        val l1 = ListNode(1)
        val m1 = ListNode(2)
        val n1 = ListNode(4)

        l1.next=m1
        m1.next=n1

        print(n1);

        val l2 = ListNode(1)
        val m2 = ListNode(2)
        val n2 = ListNode(4)

        l2.next=m2
        m2.next=n2

        return if (l1 == null && l2 == null) {
            null
        } else if (l1 == null) {
            l2
        } else if (l2 == null) {
            l1
        } else {
            val result = ListNode(-1)
            var dummy: ListNode? = result
            var node1: ListNode? = l1
            var node2: ListNode? = l2
            while (node1 != null || node2 != null) {
                if (node1 == null) {
                    dummy!!.next = ListNode(node2!!.`val`)
                    node2 = node2!!.next
                } else if (node2 == null) {
                    dummy!!.next = ListNode(node1.`val`)
                    node1 = node1.next
                } else {
                    if (node1.`val` < node2.`val`) {
                        dummy!!.next = ListNode(node1.`val`)
                        node1 = node1.next
                    } else {
                        dummy!!.next = ListNode(node2.`val`)
                        node2 = node2.next
                    }
                }
                dummy = dummy!!.next
            }
            dummy!!.next = null
            result.next
        }
    }
}