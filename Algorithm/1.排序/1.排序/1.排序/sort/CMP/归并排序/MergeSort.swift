//
//  MergeSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/6/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class MergeSort: NSObject {
    public func mergerSort(_ array:[Int])->[Int]{
        guard array.count > 1 else {return array}
        //找到中间索引
        let middleIndex = array.count / 2
        //递归分割数组的左侧
        let leftArray = mergerSort(Array(array[0..<middleIndex]))
        //递归分割数组的左侧
        let rightArray = mergerSort(Array(array[middleIndex..<array.count]))
        //合并算法
        return merge(leftPile: leftArray, rightPile: rightArray)
        
    }
    
    func merge(leftPile:[Int],rightPile:[Int]) -> [Int] {
        //合并时需要两个索引来跟踪两个数组的进度
        //左侧的索引
        var leftIndex = 0
        //右侧的索引
        var rightIndex = 0
        var orderedPile = [Int]()
        while leftIndex < leftPile.count && rightIndex < rightPile.count {
            //左侧的小于右侧的 加入 数组中 同时 左索引+1
            if leftPile[leftIndex] < rightPile[rightIndex]{
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
            }else if leftPile[leftIndex] > rightPile[rightIndex]{
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1
            }else{
                orderedPile.append(leftPile[leftIndex])
                leftIndex += 1
                orderedPile.append(rightPile[rightIndex])
                rightIndex += 1

            }
        }
        //如果前一个while循环完成，则意味着`leftPile`或`rightPile`中的一个的内容已经完全合并到`orderedPile`中。此时，您不再需要进行比较。只需依次添加剩下一个数组的其余内容到`orderedPile`。
        while leftIndex < leftPile.count {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        }
        
        while rightIndex < rightPile.count {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
        return orderedPile
    }
}
