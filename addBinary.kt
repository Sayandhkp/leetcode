package com.example.lib

import java.lang.NumberFormatException
import kotlin.math.max

/*Given two binary strings a and b, return their sum as a binary string.



Example 1:

Input: a = "11", b = "1"
Output: "100"
Example 2:

Input: a = "1010", b = "1011"
Output: "10101"


Constraints:

1 <= a.length, b.length <= 104
a and b consist only of '0' or '1' characters.
Each string does not contain leading zeros except for the zero itself.*/

fun main() {
//    addBinary("10100000100100110110010000010101111011011001101110111111111101000000101111001110001111100001101",
//        "110101001011101110001111100110001010100001101011101010000011011011001011101111001100000011011110011") //110110
//    addBinary("100","110010") //110110
    addBinary("1010","1011") //10101
    addBinary("11","1") //100
    addBinary("1111","1111") //11110
}
fun addBinary(a: String, b: String): String {
    if(a=="0"&&b=="0") return a
    var result=""

    try {
        throw NumberFormatException()
        var first=if(a.toInt()>b.toInt()) a.toInt() else b.toInt()
        var second=if(a.toInt()<b.toInt()) a.toInt() else b.toInt()

        var carry=0


        while (first!=0){
            var x=first%10 + second %10 + carry
            carry= if (x==2 || x== 3) 1 else 0
            var res=if (x==2 || x==0 ) '0' else "1"
            result="$res$result"
            first /= 10
            second /=10
        }
        if(carry==1) result= "1$result"
    }catch (e:NumberFormatException){
        var len1=a.length -1
        var len2= b.length -1
        var carry=0
        var max=max(len1,len2)
        while (max >= 0 ) {
            var x=if(len1>=0 )a[len1] else "0"
            var y=if(len2>=0 ) b [len2] else "0"
            var res="0"
             if(x.toString()=="1" && y.toString()=="1" && carry ==1){
                carry=1
                res="1"
            }else if((x.toString()=="1" && y.toString()=="0" && carry ==1)||(x.toString()=="0" && y.toString()=="1" && carry ==1)||(x.toString()=="1" && y.toString()=="1" && carry ==0)){
                carry=1
                res="0"
            }else if((carry==0 && x.toString()=="0" && y.toString()=="1")||(carry==0 && x.toString()=="1" && y.toString()=="0")||(carry==1 && x.toString()=="0" && y.toString()=="0")){
                carry=0
                 res= "1"
            }else{
                carry=0
                 res="0"
            }
            len2--
            len1--
            max--
//10101
            result="$res$result"

        }
        if(carry==1) result= "1$result"

    }


    return result
}