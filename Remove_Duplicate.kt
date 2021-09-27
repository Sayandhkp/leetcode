package com.example.lib

import java.lang.StringBuilder
import java.util.*

/*
Given the head of a sorted linked list, delete all duplicates such that each element appears only once. Return the linked list sorted as well.



Example 1:


Input: head = [1,1,2]
Output: [1,2]
Example 2:


Input: head = [1,1,2,3,3]
Output: [1,2,3]
*/

fun main(args:Array<String>){
    var node1=ListNode(1)
    var node2=ListNode(1)
    var node3=ListNode(2)
//    var node4=ListNode(3)
//    var node5=ListNode(3)
//    node4.next=node5
//    node3.next=node4
    node2.next=node3
    node1.next=node2
    var result = deleteDuplicates(node1)
    printResult("Result", result.toString())
}



// * Example:
var li = ListNode(5)
var v = li.`val`
//  Definition for singly-linked list.
class ListNode(var `val`: Int) {
    var next: ListNode? = null
}


fun deleteDuplicates(head: ListNode?): ListNode? {

    if (head?.`val`==null) return head

    var result=ListNode(head.`val`)
    var dummy:ListNode=result
    var headNode=head

    while (headNode!=null){
        if(dummy.`val`!=headNode.`val` ){
            dummy.next= ListNode(headNode.`val`)
            dummy=dummy.next!!
        }
        headNode=headNode.next


    }
    return result
}