//
//  ArrayList.swift
//  动态数组
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit
private var DEFAULT_CAPACITY : Int = 10;
private var ELEMENR_NOT_FOUNT : Int = -1;

class ArrayList<T>: NSObject {
    private var size : Int = 0
    private var elements : [T]!
    private var defaultValue: T

    //初始化
    init(capacity:Int, defaultValue: T) {
        var temp = capacity;
        self.defaultValue = defaultValue
        temp = (temp < DEFAULT_CAPACITY) ? DEFAULT_CAPACITY : temp
        self.elements = [T](repeating: defaultValue, count: temp)
//        elements = Array(repeating: "", count: temp) as? [T]
    }
    
    /// 元素的数量
    /// - Returns: 元素的数量
    func Size() -> Int {
        return size
    }
    /// 是否为空
    /// - Returns: 是否为空
    func isEmpty() -> Bool {
        return size == 0;
    }
    /// 是否包含摸个元素
    /// - Returns: 是否为空
    func contains(_ element:T) -> Bool {
        return indexOf(element: element) != ELEMENR_NOT_FOUNT
    }

    
    /// 数据插入
    /// - Parameters:
    ///   - index: 索引
    ///   - element: 插入的值
    func insert(_ index : Int , _ element : T){
        rangeCheckForAdd(index)
        ensureCapacity(capacity: size + 1) //确保容量足够大
        
        for i in (1 ..< elements.count-1).reversed(){
            elements[i+1] = elements![i];
        }
        elements[index] = element
        size += 1
    }
    /// 数据添加
    func add(_ element : T){
        insert(size, element);
    }
    /// 数据获取
    func get(_ index : Int) -> T{
        rangeCheck(index)
        return elements[index]
    }
    
    /// 设置index位置的元素
    func set(_ index : Int, _ element : Int) -> T{
        rangeCheck(index)
        let old = elements[index]
        elements[index] = element as! T
        return old
        
    }
    
    func remove(_ index : Int)->T{
        rangeCheck(index)
        let old = elements[index]
        for i in index..<size-1 {
            elements[i] = elements[i+1]
        }
        
        elements[size-1] = defaultValue//删除元素后，最后一个置为nil
        size -= 1
        return old
    }
    
    
    /// 查看元素的索引
    /// - Parameter element: 元素
    /// - Returns: 索引
    func indexOf(element : T) -> Int {
//        [result isEqual:[NSNull null]]
        if (element is NSNull){
            for i in 0..<size {
                if elements[i] is NSNull {
                    return i;
                }
            }
        }
        else{
            let element : Person = element as! Person

            for i in 0..<size {
                let ele : Person = elements[i] as! Person

                if ele.isEqual(element){
                    return i;
                }
            }
        }
        return ELEMENR_NOT_FOUNT;
    }
    
    
    /// 清空所有元素
    func clear(){
        for i in 0..<size {
            elements[i] = NSNull() as! T;
        }
        size = 0
    }
    
    
    /// 扩容操作
    func ensureCapacity(capacity:Int){
        let oldCapacity = elements.count
        if oldCapacity >= capacity {
            return
        }
        //1.5倍
        let newCapacity : Int = oldCapacity + (oldCapacity >> 1);
                
        var newElements = [T](repeating: defaultValue, count: newCapacity)

        for i in 0..<size {
            newElements[i] = elements[i]
        }
        elements = newElements
        print("size+\(oldCapacity),扩容到了\(newCapacity)")
    }
    
    func outOfBounds(_ index: Int){
        print("下标Index:\(index),Size:\(size)");
    }
    func rangeCheck(_ index : Int){
        if index < 0 || index >= size {
            outOfBounds(index)
        }
    }
    func rangeCheckForAdd(_ index : Int){
        if index < 0 || index > size {
            outOfBounds(index)
        }
    }
    
    func printArrlist(){
        for i in 0..<size {
            print("\(elements[i]),");
        }
    }
}
