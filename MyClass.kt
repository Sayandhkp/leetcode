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
private fun printResult(comment: String,result:String){
    print(comment)
    print("\n")
    print(result)
    print("\n")
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
        var l1: ListNode?= ListNode(1)
        var m1=ListNode(2)
        m1.next= ListNode(4)
        l1?.next= m1
//        l1?.next= ListNode(4)

        var l2: ListNode?= ListNode(1)
        var m2=ListNode(3)
        m2.next=ListNode(4)
        l2?.next= m2
        var result=ListNode(-1)
        var dummy=result

        if (l1==null&&l2==null){
            return null
        }else if(l1==null){
            return l2
        }else if(l2==null){
            return  l1
        }
        var node1=l1
        var node2=l2
        while (node1!=null||node2!=null){
            when {
                node1==null -> {
                    result.next=ListNode(node2!!.`val`)
                    node2=node2.next
                }
                node2==null -> {
                    result.next=ListNode(node1.`val`)
                    node1=node1.next
                }
                else -> {
//                    dummy=result.next!!
                    if(node1.`val`<=node2.`val`){
                        dummy=(ListNode(node1.`val`))
                        dummy.next=ListNode(node2.`val`)
                    }else{
                        dummy=(ListNode(node2.`val`))
                        dummy.next=ListNode(node1.`val`)
                    }
                    result.next=dummy


                    node1=node1.next
                    node2=node2.next
                }


            }
            dummy=dummy.next!!
            result=result.next!!
        }



        return result
    }
}