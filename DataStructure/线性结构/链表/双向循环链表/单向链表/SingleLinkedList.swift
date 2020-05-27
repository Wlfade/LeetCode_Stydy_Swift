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
    var current : Node?
    private var size : Int = 0

    //重置
    public func reset(){
        current = first
    }
    //current 往后走
    public func next() -> T?{
        if current == nil {
            return nil
        }
        current = current?.next
        return current?.value
    }
    //删除current结点
    public func remove() -> T?{
        if current == nil {
            return nil
        }else{
            let next = current?.next //删除之前拿到下一个
            let element = remove(theNode: current) //被删除结点的内容
            if size == 0 {
                current = nil
            }else{
                current = next
            }
            return element
        }
    }

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
            last = Node(prev: oldLast, value: element, next: first)
            if oldLast == nil {
                //添加的第一个元素
                first = last
                first?.next = first
                first?.next = first
            }else{
                oldLast?.next = last
                first?.prev = last
            }
        }
        else{
            let next = node(at: index)
            let prev = next.prev
            let node = Node(prev: prev, value: element, next: next)
            next.prev = node
            prev?.next = node
            if next == first { //index = 0 插入 0 变成头结点
                first = node
            }
            
        }
        size += 1
    }
    //末尾插入节点
    func append(_ element: T){
        add(element, at: size)
        
    }
    
    
    //移除节点
    func remove(at index: Int) -> T?{
        rangeCheck(index)
        return remove(theNode: node(at: index))
    }
    
    func remove(theNode:Node?)->T?{
        if size == 1 {
            first = nil
            last = nil
        }else{
            let prev = theNode?.prev
            let next = theNode?.next
            prev?.next = next
            next?.prev = prev

            if theNode == first {
                first = next
            }
            
            if theNode == last {
                last = prev
            }

        }
        size -= 1
        return theNode?.value
    }
    
    func removeLast() -> T?{
        return remove(theNode: node(at: size-1))
    }
    
    override var description:String {
        var s = "["
        var node = self.first
        for i in 0..<size {
            s += "\(node!.value)"
            node = node!.next
            if i != size-1 {
                s+=", "
            }
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

