//
//  BubbleSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

/**
 冒泡
 平均时间复杂度O(n^2)
 最好时间复杂度O(n)
 空间复杂度O(1)
 */
class BubbleSort: NSObject {
    func bubbleSort1(_ numbers : [Int]) -> [Int] {
        var nums = numbers
        let n = nums.count
        for i in 0..<n {
            for j in 0..<(n - 1 - i) {
                if nums[j] > nums[j + 1] {
                    nums.swapAt(j, j + 1)
                }
            }
        }
        return nums
    }
    
    func bubbleSort2(_ numbers : [Int]) -> [Int] {
        var nums = numbers
        let n = nums.count
        for i in (1..<n).reversed() {
            for j in 1...i {
                if nums[j] < nums[j - 1] {
                    nums.swapAt(j, j - 1)
                }
            }
        }
        return nums
    }
    /**
     1、 第一种优化
     如果序列已经完全有序，可以提前终止冒泡排序。
     增加一个bool值，用于判断一次循环后是否有数据交换，如果没有，则退出排序。
     如果数据不是完全有序，此优化会因添加成员变量而导致计算时间更长。
     */
    func bubbleSort3(_ numbers : [Int]) -> [Int] {
        var nums = numbers
        let n = nums.count
        for i in (1..<n).reversed() {
            var sorted = false
            for j in 1...i {
                if nums[j] < nums[j - 1] {
                    nums.swapAt(j, j - 1)
                    sorted = true
                }
            }
            if sorted == false {
                break
            }
        }
        return nums
    }

    /**
      第二种优化
     如果序列尾部已经局部有序，可以记录最后一次交换的位置，减少比较次数。
     记录上一次循环最后一次交换的位置，将其作为下一次循环的截止位置。
     */
    func bubbleSort4(_ numbers : [Int]) -> [Int] {
         var nums = numbers
         let n = nums.count
         for i in (1..<n).reversed() {
            var sortIndex = 1
            var end = i
            for j in 1...end {
            if nums[j] < nums[j - 1] {
                    nums.swapAt(j, j - 1)
                    sortIndex = j
                }
            }
            end = sortIndex
        }
        return nums
    }
}
