//
//  SingleLinkedList.swift
//  单向链表
//
//  Created by 单车 on 2020/5/20.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit
//节点
public class LinedListNode<T>: NSObject {
    public typealias Node = LinedListNode<T> //定义一个别名
    var value : T
    var next : LinedListNode? //指向后继结点
    weak var prev : LinedListNode?
    
    public init(prev:Node?, value : T, next:Node?){
        self.prev = prev
        self.value = value
        self.next = next
    }
    
}

class SingleLinkedList<T>: NSObject {
    public typealias Node = LinedListNode<T>
    var first : Node?
    var last : Node?

    private var size : Int = 0

    func Size() -> Int{
        return size
    }
    //清空
    func clear(){
        size = 0
        first = nil
        last = nil
    }
    
    func get(at index : Int) -> T {
        return node(at: index).value
    }
    //获取节点
    func node(at index : Int) -> Node{
        rangeCheck(index)
        
        if index < (size >> 1) {
            var curNode = first
            for _ in 0..<index {
                curNode = curNode?.next
            }
            return curNode!
        }
        else{
            var curNode = last
            for _ in (index..<size-1).reversed() {
                curNode = curNode?.prev
            }
            return curNode!
        }
    }
    //设置新值 返回老值
    func set(at index : Int, element : T) -> T{
        let old = self.node(at: index ).value
        self.node(at: index ).value = element;
        return old
    }
    
    //插入节点
    func add(_ element: T , at index : Int){
        rangeCheckForAdd(index)
        
        if index == size {
            let oldLast = last
            last = Node(prev: oldLast, value: element, next: nil)
            if oldLast == nil {
                first = last
            }else{
                oldLast?.next = last
            }
        }
        else{
            let next = node(at: index)
            let prev = next.prev
            let node = Node(prev: prev, value: element, next: next)
            next.prev = node
            if prev == nil {
                first = node
            }else{
                prev?.next = node
            }
            
        }
        size += 1
    }
    //末尾插入节点
    func append(_ element: T){
        add(element, at: size)
        
    }
    //移除节点
    func remove(at index: Int) -> T{
        rangeCheck(index)
        
        let theNode = node(at: index)
        let prev = theNode.prev
        let next = theNode.next
        
        if prev == nil {
            first = next
        }else{
            prev?.next = next
        }
        
        if next == nil {
            last = prev
        }else{
            next?.prev = prev
        }
        
        size -= 1
        return theNode.value
    }
    
    func removeLast() -> T {
        return remove(at: size-1)
    }
    
    override var description:String {
           var s = "["
           var node = self.first
           while node != nil {
               s += "\(node!.value)"
               node = node!.next
               if node != nil { s += ", "}
           }
           return s + "]"
       }
    
    public subscript(index : Int) ->T{
        let theNode = node(at: index)
        return theNode.value
    }
    
}

extension SingleLinkedList{
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

}

