//
//  ListSet.swift
//  Set(集合)
//
//  Created by 王玲峰 on 6/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ListSet<T:Comparable>: Set<T> {
    
    fileprivate var linkedList = SingleLinkedList<T>()
    
    override func size() -> Int? {
        return linkedList.Size()
    }
    override func isEmpty() -> Bool? {
        return linkedList.Size() == 0
    }

    override func clear(){
        linkedList.clear()
    }
    override func add(element : T){
        let index = linkedList.indexOf(element: element)
        if index == -1 { //没有该元素
            linkedList.append(element)
        }else{
            linkedList.set(at: index, element: element)
        }
    }
    override func remove(element : T){
        let index = linkedList.indexOf(element: element)
        if index != -1 {
            linkedList.remove(at: index)
        }
    }
    override func traversal(){
        let size = linkedList.Size()
        for i in 0..<size {
            print(linkedList.get(at: i))
        }
    }
}
