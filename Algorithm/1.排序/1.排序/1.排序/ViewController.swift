//
//  ViewController.swift
//  1.排序
//
//  Created by 王玲峰 on 7/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //冒泡排序
//        let nums = [3,42,1,5,34,20,9]
//        let bubbleSort = BubbleSort()
//        print(bubbleSort.bubbleSort2(nums))
//        print(bubbleSort.bubbleSort4(nums))
        
        //选择排序
//        let nums = [3,42,1,5,34,20,9]
//        let selectionSort = SelectionSort()
//        print(selectionSort.selectionSort(nums))
        
        
        //堆排序
//        var h1 = Heap(array: [5, 13, 2, 25, 7, 17, 20, 8, 4], sort: >)
//        let a1 = h1.sort()
//        print(a1)
//
//        let a2 =  heapSort([5, 13, 2, 25, 7, 17, 20, 8, 4], <)
//        print(a2)
        
        //插入排序
//        let numbers = [ 1, 2, 4, 3, 10, 27, 8, 5, 11, 31, 20, 26 ]
//        print(insertionSort1(numbers, <))
//        print(insertionSort2(numbers, <))
//
//        print(insertionSort2(numbers, >))
//        print(insertionSort4(numbers, <))

//        let count = CountingSort()
        let sortedArray = countingSort(array: [ 10, 9, 8, 7, 1, 2, 7, 3 ])

        print(sortedArray)

    }


}

