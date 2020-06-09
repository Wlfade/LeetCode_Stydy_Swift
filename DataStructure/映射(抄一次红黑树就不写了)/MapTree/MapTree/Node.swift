//
//  Node.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 6/2/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

let RED : Bool = false
let BlACK : Bool = true

class Node<K:Comparable,V:Comparable>{
    var key : K!
    var value : V!

    var left : Node<K,V>?
    var right : Node<K,V>?
    var parent : Node<K,V>?
    var color : Bool = RED

    public init(key : K, value : V, parent:Node<K,V>?){
        self.key = key
        self.value = value
        self.parent = parent
    }
    
    /// 是否是根节点
    public var isRoot: Bool {
        return parent == nil
    }
    /// 是否是叶节点
    public var isLeaf: Bool {
        return left == nil && right == nil
    }
    /// 是否是左子节点
    public var isLeftChild: Bool {
        return parent?.left === self
    }
    /// 是否是右子节点
    public var isRightChild: Bool {
        return parent?.right === self
    }
    /// 是否有左子节点
    public var hasLeftChild: Bool {
        return left != nil
    }
    /// 是否有右子节点
    public var hasRightChild: Bool {
        return right != nil
    }
    /// 是否有子节点
    public var hasAnyChild: Bool {
        return hasLeftChild || hasRightChild
    }
    /// 是否左右两个子节点都有
    public var hasBothChildren: Bool {
        return hasLeftChild && hasRightChild
    }
    /// 当前节点包括子树中的所有节点总数
    public var count: Int {
        return (left?.count ?? 0) + 1 + (right?.count ?? 0)
    }
    
    /// 判断自己是不是左子树
    public var beLeftChild: Bool {
        return parent != nil && self === parent?.left
    }
    /// 判断自己是不是右子树
    public var beRightChild: Bool {
        return parent != nil && self === parent?.right
    }
    
    //返回兄弟节点
    public var sibling: Node?{
        if beLeftChild {
            return parent?.right
        }
        if beRightChild {
            return parent?.left
        }
        
        return nil
    }

}
