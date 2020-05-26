//
//  Stack.swift
//  动态数组
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class Stack<T>: NSObject {
    //组合 用数组
//    private var list : ArrayList2 = ArrayList2<String>(capacity: 10, defaultValue: "0")
    private var list : SingleLinkedList = SingleLinkedList<String>()

    public func clear(){
        list.clear()
    }
    
    public func isEmpty()->Bool{
        return list.isEmpty()
    }
    
    public func push(element:String){
//        list.add(element) //数组
        list.append(element) //链表
    }
    
    public func pop()->String{
//        return list.remove(list.Size() - 1) //数组
        return list.removeLast() //链表
    }
    
    public func top() -> String?{
//        return list.get(list.Size() - 1) //数组
        return list.node(at: list.Size()-1).value //链表
    }

}
