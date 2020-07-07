//
//  ShellSort.swift
//  1.排序
//
//  Created by 王玲峰 on 7/7/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
//插入排序
public func insertSort(_ list: inout[Int], start: Int, gap: Int) {
    for i in stride(from: (start + gap), to: list.count, by: gap) {
        let currentValue = list[i]
        var pos = i
        while pos >= gap && list[pos - gap] > currentValue {
            list[pos] = list[pos - gap]
            pos -= gap
        }
        list[pos] = currentValue
    }
}

public func shellSort(_ list: inout [Int]){
    var sublistCount = list.count/2
    while sublistCount > 0 {
        for pos in 0..<sublistCount {
            insertSort(&list, start: pos, gap: sublistCount)
        }
        sublistCount = sublistCount / 2
    }
    
}
