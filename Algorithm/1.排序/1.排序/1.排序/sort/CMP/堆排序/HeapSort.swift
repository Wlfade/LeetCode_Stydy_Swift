//
//  HeapSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
import Foundation
/**
 堆排序可以认为是对选择排序的一种优化。
 执行步骤：

 0.对序列进行原地建堆。
 1.交换堆顶与尾元素。
 2.堆的元素数量减1。
 3.对0位置进行1此siftDown操作。
 4.重复执行1-3操作，直到堆的元素数量为1。
 最好，最坏，平均时间复杂度：O(nlogn)。
 空间复杂度O(1)，属于不稳定排序。
 */
public func heapSort<T>(_ a : [T],_ sort:@escaping (T,T)->Bool)->[T]{
    let reverseOrder = {i1,i2 in sort(i2,i1)}
    var h = Heap(array: a, sort: reverseOrder)
    return h.sort()
}

extension Heap{
    public mutating func sort()->[T]{
        for i in stride(from: (nodes.count - 1), through: 1, by: -1){
            nodes.swapAt(0, i)
            shiftDown(from: 0, until: i)
        }
        return nodes
    }
}
