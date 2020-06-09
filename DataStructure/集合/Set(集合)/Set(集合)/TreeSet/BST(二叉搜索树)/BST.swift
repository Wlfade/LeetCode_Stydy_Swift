//
//  BST.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class BST<T:Comparable> : BinaryTree<T> {
    override init() {
        super.init()
    }
   //添加之后的调整方法
   func afterAdd(node : Node<T>?){

   }
   //移除node 之后的调整
   //node 被删除的节点 或者 用以取代被删除节点的子节点（当被删除节点的度为1）
   func afterRemove(node: Node<T>?){
         
   }

    
}
//节点功能
extension BST{
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

extension BST{

    //添加节点
    public func add(value : T){
        //传入第一个节点
        if root == nil {
//            root = AVLNode<T>(value: value ,parent: nil);
            root = self.createNode(value, nil)
        
            size += 1
            //添加新节点之后的操作
            afterAdd(node: root)
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
//        let newNode = AVLNode(value: value, parent: parent)
        let newNode = self.createNode(value, parent)

        if cmp < 0 {
            parent?.right = newNode
        }else{
            parent?.left = newNode
        }
        size += 1
        //添加新节点之后的操作
        afterAdd(node: newNode)

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
        //度为2的节点 的前驱 或者 后继节点 他的度 只能是 1 或者 0
        if (node?.hasBothChildren == true) {
            //找到后继节点
            let s = successor(node: node)
            //用后继节点的值 覆盖 度为2的节点的值
            node?.value = s?.value  //这里其实已经就完成好了
            //相当于 现在改变目标 删除的是这个 度为1 或者 0 的后继节点
            node = s
        }
        
        //删除node 节点（node 的度必然是1或者0）
        let replaceMent = node?.left != nil ? node?.left : node?.right
        // 度为1 的节点
        if replaceMent != nil {
            replaceMent?.parent = node?.parent
            if node?.parent == nil {
                //node 是度为1的节点 并且是根节点
                root = replaceMent
            }else if(node == node?.parent?.left){
                node?.parent?.left = replaceMent
            }else{
                node?.parent?.right = replaceMent
            }
            //删除节点后的调整
            afterRemove(node: node)
        }else if(node?.parent == nil){
            //node 是叶子节点 同时 也是根节点
            root = nil
            //删除节点后的调整
            afterRemove(node: node)
        }else{
            //删除的节点是叶子节点
            //node 是叶子节点，但不是跟节点
            if node == node?.parent?.left {
                //这个节点是父节点的左节点就把父节点的左节点设为空
                node?.parent?.left = nil
            }else{
                //这个节点是父节点的左节点就把父节点的左节点设为空
                node?.parent?.right = nil
            }
            //删除节点后的调整
            afterRemove(node: node)
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

