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
    
    
    /// 入队
    /// - Parameter element: 元素
    public func enQueue(_ element : T){
        list.append(element)
    }
    
    
    /// 出队
    public func deQueue() -> T{
        return list.remove(at: 0)
    }
    
    
    /// 元素数量
    public func Size() -> Int{
        return list.Size()
    }
    
    /// 清空
    public func clear(){
        list.clear()
    }
    
    /// 队头元素
    public func top() -> T{
        return list.get(at: 0)
    }
    
    public func isEmpty() -> Bool {
        return list.Size() == 0
    }
    
    override var description:String {
        list.description
    }
}
