//
//  SelectionSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
/**
 选择排序的交换次数要远远少于冒泡排序，平均性能优于冒泡排序。
 最好，最坏，平均时间复杂度：O(n^2)，空间复杂度：O(1)。
 属于不稳定排序。
 */
class SelectionSort: NSObject {
    func selectionSort(_ array: [Int]) -> [Int] {
        guard array.count > 1 else {
            return array
        }
        
        var a = array
        
        for x in 0 ..< a.count - 1 {
            var lowest = x
            for y in x+1 ..< a.count {
                if a[y] < a[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {
                a.swapAt(x, lowest)
            }
        }
        return a
    }
}
