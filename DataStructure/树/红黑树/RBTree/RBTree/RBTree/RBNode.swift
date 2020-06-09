//
//  RBNode.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
let RED : Bool = false
let BlACK : Bool = true
class RBNode<T>: Node<T> {
 
    var color : Bool = RED
    
    public init(value : T, parent:RBNode?){
        super.init(value: value, parent: parent)
    }
    
}
extension RBNode{
    //红黑树节点染色方法
    class func color(_ node : RBNode<T>?, color : Bool) -> RBNode<T>? {
        guard node != nil else {
            return nil
        }
        node!.color = color
        return node!
    }
    //节点为红色
    class func red(_ node : RBNode<T>?) {
        color(node, color: RED)
    }
    
    class func redNode(_ node : RBNode<T>?) -> RBNode<T>? {
        color(node, color: RED)
    }
    //节点为黑色
    class func black(_ node : RBNode<T>?) {
        color(node, color: BlACK)
    }
    class func blackNode(_ node : RBNode<T>?) -> RBNode<T>? {
        color(node, color: BlACK)
    }

    //获取这个节点的颜色
    class func getTheNodeColor(_ node : RBNode<T>?) -> Bool{
        return ((node == nil ? BlACK : node?.color) != nil)
    }
    //节点颜色是否为黑色
    class func isBlack(_ node : RBNode<T>?) -> Bool {
        return getTheNodeColor(node) == BlACK
    }
    //节点颜色是否为红色
    class func isRed(_ node : RBNode<T>?) -> Bool {
        return getTheNodeColor(node) == RED
    }
}
