//
//  Queue.swift
//  Queue
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class Queue<T>: NSObject {
    fileprivate var list = DoubleLinkedList<T>()

    /// 元素数量
    public func Size() -> Int{
        return list.Size()
    }
    
    /// 是否为空
    public func isEmpty() -> Bool {
        return list.Size() == 0
    }
    
    /// 清空
    public func clear(){
        list.clear()
    }

    /// 从队尾入队
    /// - Parameter element: 元素
    public func enQueueRear(_ element : T){
        list.append(element)
    }
    
    /// 从队头入队
    /// - Parameter element: 元素
    public func enQueueFront(_ element : T){
        list.add(element, at: 0)
    }
    
    /// 从对尾巴出队
    public func deQueueRear() -> T{
        return list.remove(at: list.Size() - 1)
    }

    
    /// 从对头出队
    public func deQueueFront() -> T{
        return list.remove(at: 0)
    }
    
    /// 队头元素
    public func front() -> T{
        return list.get(at: 0)
    }
    
    /// 队尾元素
    public func rear() -> T{
        return list.get(at: list.Size() - 1)
    }
    
    
    override var description:String {
        list.description
    }
}
