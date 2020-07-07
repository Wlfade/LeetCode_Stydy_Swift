//
//  QuickSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/7/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

 func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    guard a.count > 1  else {
        return a
    }
    
    let pivot = a[a.count/2]
    let less = a.filter{ $0 < pivot }
    let equal = a.filter{ $0 == pivot }
    let greater = a.filter{ $0 > pivot }
    
    return quicksort(less) + equal + quicksort(greater)
}
/*
 * Lomuto的分区方案
 * 返回 新数组中基准的索引
 */
func partitionLomuto<T: Comparable>(_ a: inout [T], low: Int, high: Int) -> Int {
    let pivot = a[high]
    
    var i = low
    for j in low..<high {
        if a[j] <= pivot {
            (a[i], a[j]) = (a[j], a[i])
            i += 1
        }
    }
    
    (a[i], a[high]) = (a[high], a[i])
    return i
}

public func random(min: Int, max: Int) -> Int {
    assert(min < max)
    return min + Int(arc4random_uniform(UInt32(max - min + 1)))
}

/*
 * 随机选择基准进行快速排序
 */
func quicksortRandom<T: Comparable>(_ a: inout [T], low: Int, high: Int) {
    if low < high {
        let pivotIndex = random(min: low, max: high)
        (a[pivotIndex], a[high]) = (a[high], a[pivotIndex])
        
        let p = partitionLomuto(&a, low: low, high: high)
        quicksortRandom(&a, low: low, high: p - 1)
        quicksortRandom(&a, low: p + 1, high: high)
    }
}


