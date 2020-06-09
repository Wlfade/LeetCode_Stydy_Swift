//
//  AVLTree.swift
//  AVL-Tree
//
//  Created by 王玲峰 on 6/3/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class AVLTree <T:Comparable> : BBST<T> {
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
        return AVLNode<T>(value:value,parent:parent as? AVLNode<T>)
    }

    override func test()-> String{
        super.test()
    }

    //添加之后的调整方法
    override func afterAdd(node : Node<T>?){
         //如果添加的节点的父节点 不为空 就进入循环
         var theNode = node?.parent as? AVLNode<T>
         while theNode != nil {
             //如果平衡 这个节点的父节点的 平衡因子 绝对值 小于等于1 就是平衡的
             if isBalanced(node: theNode) {
                 //更新高度
                 updateHeight(node: theNode!) //更新这个节点的高度 可能是 0-> 1 1->0
             }
             //LL RL LR RL 旋转 平衡高度
             else{
                 rebalance(theNode!)
                 break
             }
            theNode = theNode?.parent as? AVLNode<T>
         }
    }
    //移除node 之后的调整
    //node 被删除的节点 或者 用以取代被删除节点的子节点（当被删除节点的度为1）
    override func afterRemove(node: Node<T>?){
          var theNode = node?.parent as? AVLNode<T>

          while theNode != nil {
              //如果平衡 这个节点的父节点的 平衡因子 绝对值 小于等于1 就是平衡的
              if isBalanced(node: theNode) {
                  //更新高度
                  updateHeight(node: theNode!) //更新这个节点的高度 可能是 0-> 1 1->0
              }
              //LL RL LR RL 旋转 平衡高度
              else{
                  rebalance(theNode!)
              }
              theNode = theNode?.parent as? AVLNode<T>
          }
    }
    override func afterRatate(_ grand : Node<T>!,_ parent : Node<T>!, _ child : Node<T>?){
        super.afterRatate(grand, parent, child)
        
//        更新高度
//        现在grand 是parent 的子节点 所以 从下往上 更新高度
        updateHeight(node: grand as! AVLNode<T>)

        updateHeight(node: parent as! AVLNode<T>)

        print(self.levelOrder(root))
        print("新高度：\(self.height1())")

    }
    override func rotate (
         _ r : Node<T>?,
         _ b : Node<T>!,_ c : Node<T>?,
         _ d : Node<T>!,
         _ e : Node<T>?,_ f : Node<T>!){
        super.rotate(r,b,c,d,e,f)
        updateHeight(node: b as! AVLNode<T>)
        updateHeight(node: f as! AVLNode<T>)
        updateHeight(node: d as! AVLNode<T>)
    }
}



extension AVLTree{
    
    
    //更新高度
    func updateHeight(node : AVLNode<T>){
        node.updateHeight()
    }
    
    //新加入的 节点的 爷爷级别的节点
    //恢复·平衡
    //判断传入节点是否平衡 (平衡因子的绝对值 <= 1)
    func isBalanced(node : AVLNode<T>?) -> Bool {
        return abs((node?.balanceFactor())!) <= 1
    }
}
//rebalance 恢复平衡
extension AVLTree{
    func rebalance(_ grand : AVLNode<T>){
        print(self.levelOrder(root))
        print("原高度：\(self.height1())")
        print("---------")
        //获取高度较高的 子节点
        let parent = grand.tallerChild()
        let node = parent.tallerChild()
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                rotateRight(grand)
            }else{ //LR
                rotateLeft(parent)
                rotateRight(grand)
            }
        }else{ //R
            if node.isLeftChild { //RL
                rotateRight(parent)
                rotateLeft(grand)
            }else{ //RR
                rotateLeft(grand)
            }
        }
    }
    
    func rebalance2(_ grand : AVLNode<T>){
        print(self.levelOrder(root))
        print("原高度：\(self.height1())")
        print("---------")
        //获取高度较高的 子节点
        let parent = grand.tallerChild()
        let node = parent.tallerChild()
        if parent.isLeftChild { //L
            if node.isLeftChild { //LL
                rotate(grand, node, node.right as? AVLNode<T>, parent, parent.right as? AVLNode<T>, grand)
            }else{ //LR
                rotate(grand, parent, node.left as? AVLNode<T>, node, node.right as? AVLNode<T>, grand)
            }
        }else{ //R
            if node.isLeftChild { //RL
                rotate(grand, grand, node.left as? AVLNode<T>, node, node.right as? AVLNode<T>, node)
            }else{ //RR
                rotate(grand, grand, parent.left as? AVLNode<T>, parent, node.left as? AVLNode<T>, node)
            }
        }
    }

}

////节点的旋转
//extension AVLTree{
//    //左旋转
//    func rotateLeft(_ grand : AVLNode<T>){
//        let parent = grand.right as? AVLNode<T>
//        let child = parent?.left as? AVLNode<T>
//        grand.right = child
//        parent?.left = grand
//        afterRatate(grand, parent, child)
//    }
//    //右旋转
//    func rotateRight(_ grand : AVLNode<T>){
//        let parent = grand.left as? AVLNode
//        let child = parent?.right as? AVLNode
//        grand.left = child
//        parent?.right = grand
//        afterRatate(grand, parent, child)
//    }
//    
//    func afterRatate(_ grand : AVLNode<T>!,_ parent : AVLNode<T>!, _ child : AVLNode<T>?){
//        //让parent 成为子树的根节点
//        if grand.isLeftChild {
//            parent.parent = grand!.parent
//
//            grand.parent?.left = parent
//        }else if grand.isRightChild{
//            parent.parent = grand!.parent
//
//            grand.parent?.right = parent
//        }else{
//            root = parent
//        }
//        if child != nil {
//            child?.parent = grand
//        }
//        
//        grand.parent = parent
//        //更新高度
//        //现在grand 是parent 的子节点 所以 从下往上 更新高度
//        updateHeight(node: grand)
//        
//        updateHeight(node: parent)
//        
//        print(self.levelOrder(root))
//        print("新高度：\(self.height1())")
//
//    }
//}
////旋转的统一处理
//extension AVLTree{
//        func rotate (
//            _ r : AVLNode<T>?,
//            _ b : AVLNode<T>!,_ c : AVLNode<T>?,
//            _ d : AVLNode<T>!,
//            _ e : AVLNode<T>?,_ f : AVLNode<T>!){
//            //让d成为这棵子树的根节点
//            d.parent = r?.parent
//            if (r?.isLeftChild == true) {
//                r?.parent?.left = d
//            }else if(r?.isRightChild == true){
//                r?.parent?.right = d
//            }else{
//                root = d
//            }
//            b.right = c
//            if c != nil {
//                c?.parent = b
//            }
//            updateHeight(node: b)
//
//            f.left = e
//            if e != nil {
//                e?.parent = f
//            }
//            updateHeight(node: f)
//
//            d.left = b
//            d.right = f
//            b.parent = d
//            f.parent = d
//            updateHeight(node: d)
//
//        }
//        
//    //    func rotate (
//    //    _ r : AVLNode<T>?,
//    //    _ a : AVLNode<T>?, _ b : AVLNode<T>!,_ c : AVLNode<T>?,
//    //    _ d : AVLNode<T>!,
//    //    _ e : AVLNode<T>?,_ f : AVLNode<T>!,_ g : AVLNode<T>?){
//    //        //让d成为这棵子树的根节点
//    //        d.parent = r?.parent
//    //        if (r?.isLeftChild == true) {
//    //            r?.parent?.left = d
//    //        }else if(r?.isRightChild == true){
//    //            r?.parent?.right = d
//    //        }else{
//    //            root = d
//    //        }
//    //        b.left = a
//    //        if a != nil {
//    //            a?.parent = b
//    //        }
//    //
//    //        b.right = c
//    //        if c != nil {
//    //            c?.parent = b
//    //        }
//    //        updateHeight(node: b)
//    //
//    //        f.left = e
//    //        if e != nil {
//    //            e?.parent = f
//    //        }
//    //        f.right = g
//    //        if g != nil {
//    //            g?.parent = f
//    //        }
//    //
//    //        updateHeight(node: f)
//    //
//    //        d.left = b
//    //        d.right = f
//    //        b.parent = d
//    //        f.parent = d
//    //        updateHeight(node: d)
//    //    }
//
//}
