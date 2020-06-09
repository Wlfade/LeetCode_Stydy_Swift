//
//  TreeMap.swift
//  MapTree
//
//  Created by 王玲峰 on 6/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class TreeMap<K:Comparable,V:Comparable>: Map<K,V> {
    var size : Int = 0
    var root : Node<K,V>?
    override init() {
        super.init()
    }
    override func Size() -> Int {
        return size
    }
    
    override func isEmpty() -> Bool {
        return size == 0
    }
    
    override func clear(){
        root = nil
        size = 0
    }
    
    override func put(_ key:K,_ value:V) -> V? {
        keyNotNullCheck(key: key) as! V
        
    }
    
    override func get(_ key : K) -> V? {
        return nil
    }
    
    override func remove(_ key : K) -> V? {
        return nil
    }
    
    override func containsKey(_ key : K) -> Bool {
        return false
    }
    
    override func containsValue(_ value : V) -> Bool {
        return false
    }
    
    override func traversal(){
        
    }
    
    func keyNotNullCheck(key : K?){
        if key == nil {
            print("key must not be null")
        }
    }
}
