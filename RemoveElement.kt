package com.example.lib

fun main(args:Array<String>){

    var result= removeElement(intArrayOf(0,1,2,2,3,0,4,2),2)
    printResult("Remove Element ",result.toString())
}

fun removeElement(nums: IntArray, `val`: Int): Int {
    var result=0

    for (i in nums.indices){
        if(nums[i]!=`val`){
            nums[result]=nums[i]
            result++
        }
    }

    return result
}