//
//  BinarySearchTreeNew.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 6/2/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class BinarySearchTreeNew<T:Comparable> : BinaryTree<T> //MJBinaryTreeInfo
{
    
//    func root() -> Any {
//        return root as Any
//    }
//    
//    func left(_ node: Any) -> Any {
//        return nil
//    }
//    
//    func right(_ node: Any) -> Any {
//        re
//    }
//    
//    func string(_ node: Any) -> Any {
//        <#code#>
//    }
    

    override init() {
        super.init()
    }
    public convenience init(_ array : [T]){
        precondition(array.count > 0)
        self.init()
        
    }
}

extension BinarySearchTreeNew{
    //添加节点
    public func add(value : T){
        //传入第一个节点
        if root == nil {
            root = Node<T>(value: value ,parent: nil);
            size += 1
            return
        }
        var node = root
        var parent = root
        var cmp = 0
        while node != nil {
            parent = node //父节点
            cmp = compareTo(t1: (node?.value!)!, t2: value)
            if cmp < 0 {
                node = node?.right
            }else if(cmp > 0){
                node = node?.left
            }else{
                node?.value = value //相等，最好是覆盖掉
                return
            }
        }
        let newNode = Node(value: value, parent: parent)
        if cmp < 0 {
            parent?.right = newNode
        }else{
            parent?.left = newNode
        }
        size += 1
    }
    //是否包含某个元素
    func contains(element : T) ->  Bool{
        return node(element: element) != nil
    }

    //传入元素删除节点
    func remove(element : T?){
        if(elementNotNilCheck(element: element) == false){
              return
            }
        let nod = node(element: element!)
        remove(node: nod)
    }
    //删除节点
    private func remove(node:Node<T>?){
        var node = node
        
        if node == nil {
            return
        }
        size -= 1
        //度为2的节点
        if (node?.hasBothChildren == true) {
            //找到后继节点
            let s = successor(node: node)
            //用后继节点的值 覆盖 度为2的节点的值
            node?.value = s?.value
            
            //删除后继节点
            node = s
        }
        
        //删除node 节点（node 的度必然是1或者0）
        let replaceMent = node?.left != nil ? node?.left : node?.right
        // 度为1 的节点
        if replaceMent != nil {
            replaceMent?.parent = node?.parent
            //更改parent的left / right 的指向
            if node?.parent == nil {
                //node 是度为1的节点 并且是根节点
                root = replaceMent
            }else if(node == node?.parent?.left){
                node?.parent?.left = replaceMent
            }else{
                node?.parent?.right = replaceMent
            }
        }else if(node?.parent == nil){
            //node 是叶子节点 同时 也是根节点
            root = nil
        }else{
            //node 是叶子节点，但不是跟节点
            if node == node?.parent?.left {
                node?.parent?.left = nil
            }else{
                node?.parent?.right = nil
            }
        }
    }

    //传入元素获取前序元素
    func predecessor(element : T) -> T? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        let nod = node(element: element)
        guard nod != nil else{
            return nil
        }
        let preNode = predecessor(node: nod)
        
        return preNode?.value
    }
    
    //传入元素获取后序元素
    func successor(element : T) -> T? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        let nod = node(element: element)
        guard nod != nil else{
            return nil
        }
        let sucNode = successor(node: nod)
        
        return sucNode?.value
    }


}
//节点功能
extension BinarySearchTreeNew{
    //节点元素比较
    private func compareTo(t1 : T,t2 : T) -> Int{
        var cmp : Int
        if t1 < t2 {
            cmp = -1
        }else if (t1 > t2){
            cmp = 1
        }else{
            cmp = 0
        }
        return cmp
    }

    //检测传入的元素是否为空
    private func elementNotNilCheck(element : T?)->Bool{
        if element == nil {
            print("element must not nil")
            return false
        }
        return true
    }
    //根据元素获取节点
    private func node(element : T) -> Node<T>? {
        if(elementNotNilCheck(element: element) == false){
            return nil
        }
        
        var node = root
        while node != nil {
            let cmp = compareTo(t1: element, t2: node!.value)
            if(cmp < 0){
                node = node?.left
            }else if(cmp > 0){
                node = node?.right
            }else{
                return node
            }
        }
        return nil
        
    }
}
