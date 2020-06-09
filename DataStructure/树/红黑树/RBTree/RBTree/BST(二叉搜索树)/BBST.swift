//
//  BBST.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//
//平衡搜索二叉树
import UIKit
class BBST <T:Comparable> : BST<T>{
    override init() {
        super.init()
    }
    //左旋转
    func rotateLeft(_ grand : Node<T>){
        let parent = grand.right
        let child = parent?.left
        grand.right = child
        parent?.left = grand
        afterRatate(grand, parent, child)
    }
    //右旋转
    func rotateRight(_ grand : Node<T>){
        let parent = grand.left
        let child = parent?.right
        grand.left = child
        parent?.right = grand
        afterRatate(grand, parent, child)
    }
    
    func afterRatate(_ grand : Node<T>!,_ parent : Node<T>!, _ child : Node<T>?){
        //让parent 成为子树的根节点
        if grand.isLeftChild {
            parent.parent = grand!.parent

            grand.parent?.left = parent
        }else if grand.isRightChild{
            parent.parent = grand!.parent

            grand.parent?.right = parent
        }else{
            root = parent
        }
        if child != nil {
            child?.parent = grand
        }
        
        grand.parent = parent

    }
    //节点的旋转
    //旋转的统一处理
   func rotate (
        _ r : Node<T>?,
        _ b : Node<T>!,_ c : Node<T>?,
        _ d : Node<T>!,
        _ e : Node<T>?,_ f : Node<T>!){
        //让d成为这棵子树的根节点
        d.parent = r?.parent
        if (r?.isLeftChild == true) {
            r?.parent?.left = d
        }else if(r?.isRightChild == true){
            r?.parent?.right = d
        }else{
            root = d
        }
        b.right = c
        if c != nil {
            c?.parent = b
        }

        f.left = e
        if e != nil {
            e?.parent = f
        }

        d.left = b
        d.right = f
        b.parent = d
        f.parent = d
    
//        updateHeight(node: b)
//        updateHeight(node: f)
//        updateHeight(node: d)
    }
        
    //    func rotate (
    //    _ r : Node<T>?,
    //    _ a : Node<T>?, _ b : Node<T>!,_ c : Node<T>?,
    //    _ d : Node<T>!,
    //    _ e : Node<T>?,_ f : Node<T>!,_ g : Node<T>?){
    //        //让d成为这棵子树的根节点
    //        d.parent = r?.parent
    //        if (r?.isLeftChild == true) {
    //            r?.parent?.left = d
    //        }else if(r?.isRightChild == true){
    //            r?.parent?.right = d
    //        }else{
    //            root = d
    //        }
    //        b.left = a
    //        if a != nil {
    //            a?.parent = b
    //        }
    //
    //        b.right = c
    //        if c != nil {
    //            c?.parent = b
    //        }
    //        updateHeight(node: b)
    //
    //        f.left = e
    //        if e != nil {
    //            e?.parent = f
    //        }
    //        f.right = g
    //        if g != nil {
    //            g?.parent = f
    //        }
    //
    //        updateHeight(node: f)
    //
    //        d.left = b
    //        d.right = f
    //        b.parent = d
    //        f.parent = d
    //        updateHeight(node: d)
    //    }
}
