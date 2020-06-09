//
//  TreeSet.swift
//  Set(集合)
//
//  Created by 王玲峰 on 6/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class TreeSet<T:Comparable>: Set<T> {
    
    fileprivate var tree = RBTree<T>()
    
    override func size() -> Int? {
        return tree.Size()
    }
    override func isEmpty() -> Bool? {
        return tree.Size() == 0
         
    }

    override func clear(){
        tree.clear()
    }
    override func contains (element : T) -> Bool{
        return tree.contains(element: element)
    }
    override func add(element : T){
        tree.add(value: element)
        
    }
    override func remove(element : T){
        tree.remove(element : element)
    }
    override func traversal(){
        tree.inOrderTraversal()
    }
}
