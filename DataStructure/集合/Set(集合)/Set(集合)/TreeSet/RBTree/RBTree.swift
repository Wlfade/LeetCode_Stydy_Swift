//
//  RBTree.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class RBTree<T:Comparable> : BBST<T>{
    override init() {
        super.init()
    }
    public convenience init(_ array : [T]){
        precondition(array.count > 0)
        self.init()
        for v in array {
            add(value: v)
        }
    }
    
    override func createNode(_ value : T ,_ parent : Node<T>?) -> Node<T>{
        return RBNode<T>(value:value,parent:parent as? RBNode<T>)
    }


    //添加之后的调整方法
    override func afterAdd(node : Node<T>?){
         //如果添加的节点的父节点 不为空 就进入循环
        let parent = node?.parent as? RBNode<T>
        //添加的节点是根节点 或者 上溢到达了根节点
        if parent == nil {
            RBNode.black(parent)
            return
        }
        //如果父节点是黑色，直接返回
        if RBNode.isBlack(parent) {
            return
        }
        //叔父节点 （父节点的同级节点）
        let uncle = parent?.sibling as! RBNode<T>
        //祖父节点 染红
        let grand = RBNode.redNode((parent?.parent as! RBNode<T>))
        //叔父节点是否为红色
        if RBNode.isRed(uncle) {
            //叔父节点是红色【B 树节点 上溢】
            RBNode.black(parent)
            RBNode.black(uncle)

            //祖父节点上溢 递归
            afterAdd(node: grand)
            return
        }
        //叔父节点不是红色
        if parent?.isLeftChild == true { //L
            if node?.isLeftChild == true { //LL
                RBNode.black(parent)
            }else{ //LR
                RBNode.black(node as? RBNode<T>)
                rotateLeft(parent!)
            }
            rotateRight(grand!)
        }
        else{
            if node?.isLeftChild == true { //RL
                RBNode.black(node as? RBNode<T>)
                rotateRight(parent!)
            }else{ //RR
                RBNode.black(parent)
            }
            rotateLeft(grand!)
        }

    }
    //移除node 之后的调整
    //node 被删除的节点 或者 用以取代被删除节点的子节点（当被删除节点的度为1）
    override func afterRemove(node: Node<T>?){
        let node = node as? RBNode<T>
        //如果删除的节点是红色 或则 用来代替删除的子节点是红色
        if RBNode.isRed(node) {
            RBNode.black(node)
            return
        }
        
        let parent = node?.parent as? RBNode<T>
        if parent == nil {
            return
        }
        //删除的是黑色叶子节点 下溢
        //判断被删除的node是左还是右
        let left = parent?.left == nil || ((node?.isLeftChild) != nil)
        var sibiling = (left ? parent?.right : parent?.left) as? RBNode<T>
        if left {
            //兄弟节点 是红色的
            if RBNode.isRed(sibiling){
                RBNode.black(sibiling)
                RBNode.red(parent)
                rotateLeft(parent!)
                
               //更换兄弟
                sibiling = parent?.right as? RBNode<T>
            }
            //兄弟黑色节点 没有子节点 
            if (RBNode.isBlack(sibiling?.left as? RBNode<T>) &&
                RBNode.isBlack(sibiling?.right as? RBNode<T>)){
                //兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = RBNode.isBlack(parent) //判断父节点是否为黑色
                RBNode.black(parent)
                RBNode.red(sibiling)
                //父节点为黑色 会导致父节点 也下溢 需要把父节点当做删除的节点处理即可 递归
                if parentBlack {
                    afterRemove(node: parent)
                }
            }else{
                //兄弟节点至少有一个红色子节点，向兄弟节点借元素
                //兄弟节点的左边是黑色(只有一个红色节点 在兄弟节点的右边)，兄弟要先旋转
                if RBNode.isBlack(sibiling?.right as? RBNode<T>) {
                    rotateRight(sibiling!)
                    sibiling = parent?.right as? RBNode<T>
                }
                RBNode.color(sibiling, color: RBNode.getTheNodeColor(parent))
                RBNode.black(sibiling?.right as? RBNode<T>)
                RBNode.black(parent)
                rotateLeft(parent!)

            }
        }
        else{
            //被删除的节点在右边，兄弟节点在左边
            if RBNode.isRed(sibiling){
                RBNode.black(sibiling)
                RBNode.red(parent)
                rotateRight(parent!)
                
               //更换兄弟
                sibiling = parent?.left as? RBNode<T>
            }
            //兄弟有没有红色叶子节点
            if (RBNode.isBlack(sibiling?.left as? RBNode<T>) &&
                RBNode.isBlack(sibiling?.right as? RBNode<T>)){
                //兄弟节点没有1个红色子节点，父节点要向下跟兄弟节点合并
                let parentBlack = RBNode.isBlack(parent)
                RBNode.black(parent)
                RBNode.red(sibiling)
                if parentBlack {
                    afterRemove(node: parent)
                }
            }else{
                //兄弟节点至少有一个红色子节点，向兄弟节点借元素
                //兄弟节点的左边是黑色，兄弟要先旋转
                if RBNode.isBlack(sibiling?.left as? RBNode<T>) {
                    rotateLeft(sibiling!)
                    sibiling = parent?.left as? RBNode<T>
                }
                RBNode.color(sibiling, color: RBNode.getTheNodeColor(parent))
                RBNode.black(sibiling?.left as? RBNode<T>)
                RBNode.black(parent)
                rotateRight(parent!)

            }
        }
    }
}
