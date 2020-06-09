//
//  AVLNode.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class AVLNode<T>: Node<T> {
    var height : Int = 1
    
    public init(value : T, parent:AVLNode?){
        super.init(value: value, parent: parent)
    }
    
}

extension AVLNode{
    //获取该节点平衡因子
    public func balanceFactor()->Int{
        var leftHeight : Int = 0
        if left != nil{
            let theLeft = left as! AVLNode<T>
            leftHeight = theLeft.height
        }
                
        var rightHeight : Int = 0
        if right != nil{
            let theRight = right as! AVLNode<T>
            rightHeight = theRight.height

        }
        return leftHeight - rightHeight
    }
    
    //更新高度
    func updateHeight() {
        var leftHeight : Int = 0
        if left != nil{
            let theLeft = left as! AVLNode<T>
            leftHeight = theLeft.height
        }
                
        var rightHeight : Int = 0
        if right != nil{
            let theRight = right as! AVLNode<T>
            rightHeight = theRight.height
            
        }
        //自身高度加上 左右子树高度中较高的
        height = 1+max(leftHeight, rightHeight)
    }
    
    //获取子节点 高度较高的 子节点
    func tallerChild() -> AVLNode<T> {
        var leftHeight : Int = 0
        if left != nil{
            let theLeft = left as! AVLNode<T>
            leftHeight = theLeft.height
            
        }
                
        var rightHeight : Int = 0
        if right != nil{
            let theRight = right as! AVLNode<T>
            rightHeight = theRight.height
            
        }
        if leftHeight > rightHeight {
            return left! as! AVLNode<T>
        }
        if rightHeight > leftHeight {
            return right! as! AVLNode<T>
        }
        //判断自己是 父节点的 左子树 还是右子树 一样的就 返回 同方向的 节点
        return (beLeftChild == true ? left : right)! as! AVLNode<T>
    }
}
