//
//  InsertionSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
/**
 最坏，平均时间复杂度：O(n^2)
 最好时间复杂度：O(n)
 空间复杂度：O(1)
 */
public func insertionSort1<T>(_ array : [T],_ isOrderedBefore:(T,T)->Bool)->[T]{
    var a = array
    for x in 1..<a.count {
        var y = x
        while y > 0  && isOrderedBefore(a[y],a[y-1]){
            a.swapAt(y, y-1)
            y-=1
        }
    }
    return a
}
/**
 1、 第一种优化
 思路是将【交换】转为【挪动】。
 */
public func insertionSort2<T>(_ array : [T],_ isOrderedBefore:(T,T)->Bool)->[T]{
    var a = array
    for x in 1..<a.count {
        var y = x
        let temp = a[y] //将待插入元素备份
        while y > 0  && isOrderedBefore(temp,a[y-1]){
            // 头部有序数据中比待插入元素大的，都朝尾部方向挪动1个位置
            a[y] = a[y-1]
            y-=1
        }
        // 将待插入元素放到最终的合适位置
        a[y] = temp
    }
    return a
}

public func insertionSort3<T>(_ array : [T],_ isOrderedBefore:(T,T)->Bool)->[T]{
    let list = array
    //建立一个空数组，符合条件的插入，没插入的尾后添加
    var newList = [list[0]]
    for i in 1..<list.count {
        var min : Int? = nil
        for j in 0..<newList.count {
            if isOrderedBefore(list[i],newList[j]){
                min = i
                newList.insert(list[i], at: j)
                break
            }
        }
        if min == nil {
            newList.append(list[i])
        }
    }
    return newList
}

/**
 第二种优化（二分搜索优化）
 */
public func insertionSort4<T>(_ array : [T],_ isOrderedBefore:(T,T)->Bool)->[T]{
    let list = array
     //建立一个空数组，符合条件的插入，没插入的尾后添加
    var newList = [list[0]]
    for i in 1..<list.count {

        let temp = list[i]
        var left = 0
        var right = i-1

        //二分法优化
        while left<=right {
            let middle = (left + right) / 2
            if isOrderedBefore(temp,newList[middle])  {
                right = middle - 1
            }else{
                left = middle + 1
            }
        }
        print("temp:\(temp)--newList:\(newList)--left:\(left)")
        newList.insert(temp, at: left)
    }
    return newList

}
