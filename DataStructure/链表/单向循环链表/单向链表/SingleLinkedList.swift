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
    var next : LinedListNode?
//    weak var previous : LinedListNode?
    public init(value : T, next:Node?){
        self.value = value
        self.next = next
    }
    
}

class SingleLinkedList<T>: NSObject {
    public typealias Node = LinedListNode<T>
    var head : Node?
    private var size : Int = 0
    
    //这样写只有一个 get方法
//    private var size : Int {
//        guard var node = head else{
//            return 0
//        }
//        var size = 1
//        while let next = node.next {
//            node = next
//            size += 1
//        }
//        return size
//    }

    
    func Size() -> Int{
        return size
    }
    //清空
    func clear(){
        size = 0
        head = nil
    }
    //获取节点
    func node(at index : Int) -> Node{
        rangeCheck(index)
        var node = head
        for _ in 0..<index{
            node = node?.next
        }
        return node!
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
        
        if index == 0 {
            
            let newHead = Node(value: element, next: head)
            
            let last = (size == 0) ? newHead : node(at: size-1)
            last.next = newHead;
            head = newHead
        }else{
            let prev = node(at: index - 1)
            prev.next = Node(value: element, next: prev.next!)
            
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
        
        var theNode = head!
        if index == 0 {
            
            if size == 1 {
                head = nil
            }else{
                let last = node(at: size-1)
                head = head?.next
                last.next = head
            }
        }else{
            let prev = node(at: index - 1)
            theNode = prev.next!
            prev.next = theNode.next
        }
        size -= 1
        return theNode.value
    }
    
    func removeLast() -> T {
        return remove(at: size-1)
    }
    
    //迭代
    func reverseList(_ head : Node?) -> Node?{
        if head == nil || head?.next == nil{
            return head
        }
        var newHead: Node? = self.node(at: 0).next
        var p = head
        while p != nil {
            let tmp = p?.next
            p?.next = newHead
            newHead = p
            p = tmp
        }
        return newHead
    }
    //递归翻转
//    func reverseList(_ head: Node?) -> Node? {
//        if head == nil || head?.next == nil {
//            return head
//        }
//        let newHead = reverseList(head?.next)
//        head?.next?.next = head
//        head?.next = nil
//        return newHead
//    }
    
    
    override var description:String {
           var s = "["
           var node = self.head
//           while node != nil {
//               s += "\(node!.value)"
//               node = node!.next
//               if node != nil { s += ", "}
//           }
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

