//
//  CountingSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/7/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

//class CountingSort: NSObject {
////    enum CountingSortError: Error {
////        case arrayEmpty
////    }
//
//    func countingSort(array: [Int]) throws -> [Int] {
////        guard array.count > 0 else {
////            throw CountingSortError.arrayEmpty
////        }
//
//        // Step 1 创建一个数组来存储每个元素的计数
//        let maxElement = array.max() ?? 0
//
//        var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
//        for elemnt in array {
//            countArray[elemnt] += 1
//        }
//
//        print(countArray)
//
//        // Step 2 将每个值设置为前两个值的总和
//        for index in 1 ..< countArray.count {
//            let sum = countArray[index] + countArray[index - 1]
//            countArray[index] = sum
//        }
//
//        print(countArray)
//
//        // Step 3 根据元素前面的元素数将元素放在最终数组中
//        var sortedArray = [Int](repeating: 0, count: array.count)
//        for element in array {
//            countArray[element] -= 1
//            sortedArray[countArray[element]] = element
//        }
//        return sortedArray
//    }
//
//
//}
//enum CountingSortError: Error {
//    case arrayEmpty
//}

func countingSort(array: [Int])-> [Int] {
    print(array)
    guard array.count > 0 else {
        return array
    }
    
    // Step 1 创建一个数组来存储每个元素的计数
    let maxElement = array.max() ?? 0
    
    var countArray = [Int](repeating: 0, count: Int(maxElement + 1))
    for elemnt in array {
        countArray[elemnt] += 1
    }
    
    print(countArray)
    
    // Step 2 将每个值设置为前两个值的总和
    for index in 1 ..< countArray.count {
        let sum = countArray[index] + countArray[index - 1]
        countArray[index] = sum
    }
    
    print(countArray)
    
    // Step 3 根据元素前面的元素数将元素放在最终数组中
    var sortedArray = [Int](repeating: 0, count: array.count)
    for element in array {
        countArray[element] -= 1
        sortedArray[countArray[element]] = element
        print(sortedArray)
    }
    return sortedArray
}
