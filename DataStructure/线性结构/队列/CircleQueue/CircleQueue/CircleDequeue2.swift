//
//  CircleDequeue2.swift
//  CircleDequeue2
//
//  Created by 王玲峰 on 5/27/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class CircleDequeue2<T>: NSObject {
    private var front : Int = 0 //队头指针
    private var size : Int = 0 //元素数量
    
    //利用动态扩容数组实现的循环队列
    private var elements : [T?]! //元素数组
    
    private var DEFAULT_CAPACITY : Int = 10;
    
    private var ELEMENR_NOT_FOUNT : Int = -1;
    
    private var defaultValue: T //默认值

    
    init(defaultValue : T?) {
        self.defaultValue = defaultValue!
        elements = [T](repeating: defaultValue!, count: DEFAULT_CAPACITY)
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
    
    /// 清空所有元素
    func clear(){
        for i in 0..<size {
            elements[i] = defaultValue;
        }
        size = 0
        front = 0
    }
    
    /// 从队尾入队
    public func enQueueRear(element:T?){
        ensureCapacity(capacity: size+1)
        elements[index(size)] = element
        size += 1
    }
    
    /// 从队头入队
    public func enQueueFront(element:T?){
        ensureCapacity(capacity: size+1)
        front = index(-1)
        elements[front] = element
        size += 1
    }
    
    /// 从对尾出队
    public func deQueueRear() -> T?{
        let rearIndex = index(size - 1)
        
        let rearElement = elements[rearIndex]
        
        elements[rearIndex] = defaultValue
        size -= 1
        return rearElement
    }
    /// 从对头出队
    public func deQueueFront() -> T?{
        let frontElement = elements[front]
        elements[front] = defaultValue
        front = index(1)
        size -= 1
        return frontElement
    }
    
    
    /// 获取头部元素
    public func getFront() -> T?{
        return elements[front]
    }
    
    /// 获取头部元素
    public func rear() -> T?{
        return elements[index(size - 1)]
    }

    
    // 将真实索引转换为循环队列上的索引
    private func index(_ index : Int) -> Int{
        var theIndex = index
        
        theIndex = front + theIndex
        
        if index < 0 {
            return theIndex + elements.count
        }
        
        return index % elements.count
        
    }
}
//MARK:- 扩容 缩容
extension CircleDequeue2{
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
            newElements[i] = elements[index(i)]! //拷贝原数组元素到新数组
         }
         elements = newElements
        front = 0 //重置front
         print("size+\(oldCapacity),扩容到了\(newCapacity)")
     }
    
    ///缩容
    func trim(){
        let oldCapacity = elements.count
        let newCapacity = oldCapacity >> 1
        if size > newCapacity || oldCapacity <= DEFAULT_CAPACITY {
            return
        }
        //空间很多需要缩容
        var newElements = [T](repeating: defaultValue, count: newCapacity)
        for i in 0..<size {
            newElements[i] = elements[i]!
        }
        elements = newElements
        print("size+\(oldCapacity),缩容到了\(newCapacity)")

    }

    
}

//MARK:- 打印和判断
extension CircleDequeue2 {
    //越界
    func outOfBounds(_ index: Int){
        print("下标Index:\(index),Size:\(size)");
    }
    //
    func rangeCheck(_ index : Int){
        if index < 0 || index >= size {
            outOfBounds(index)
        }
    }
    //
    func rangeCheckForAdd(_ index : Int){
        if index < 0 || index > size {
            outOfBounds(index)
        }
    }
    //打印
//    func printArrlist(){
//
//        for i in 0..<size {
//            print("\(elements[i] ?? defaultValue),");
//        }
//    }
     func description() -> String{
        var s = "["
        for i in 0..<elements.count {
            s += "\(elements[i] ?? defaultValue)"
            if i != elements.count - 1 {
                s+=", "
            }
        }
        return s + "]"
    }
}
