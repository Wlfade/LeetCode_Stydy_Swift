//
//  SolutionTwo.swift
//  LeetCode_1010
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

//class SolutionTwo: NSObject {
//    class func numPairsDivisibleBy60(_ time: [Int]) -> Int {
//        var count = 0
//        var seconds : [Int] = Array(repeating: 0, count: 60)
//
//        for t in time {
//            seconds[t % 60] += 1
//        }
//        count += combination(seconds[30] ,2)
//        count += combination(seconds[0] , 2)
//        var i : Int = 1
//        var j : Int = 59
//        while i<j {
//            i += 1
//            j -= 1
//            count += (seconds[i]) * (seconds[j])
//
//        }
//        return count;
//
//
//     }
//    //求组合数
//    class func combination(_ n:Int,_ k: Int) -> Int {
//        var result : Int = 1
//        for i in 1...k{
//            result = result * (n - i + 1) / i;
//        }
//        return result
//    }
//}


class SolutionTwo: NSObject {
    class func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        var res = 0
        var rems: [Int] = Array(repeating: 0, count: 60)
        for t in time {
            //生成一个60个数量的数组 余数的个数
            //40 变成 下标40 处 元素为1
            rems[t % 60] += 1
        }
        for i in (0..<rems.count - 1) {
            for j in  (i..<rems.count) {
//                print("i:\(i),j:\(j)")
                if (i + j) % 60 == 0 { //下标相加为60的 进入判断
                    print("i:\(i),j:\(j)")
                    if i == j {
                        // i = j i = j = 0 或 30
                        //假设 30处下标元素为 2
                        /**
                         输入：[60,60,60]
                         或 输入：[30,30,30]
                         输出：3
                         解释：所有三对的总持续时间都是 120，可以被 60 整数。
                         */
                       res = res + ((rems[i] * (rems[i] - 1)) / 2)
                    } else if rems[i] != 0 && rems[j] != 0 {
                        res += (rems[i] * rems[j])
                    }
                 }
            }
        }
        return res
    }
}

