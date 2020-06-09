//
//  BinaryTree.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 6/2/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class BinaryTree <T: Comparable>{
    var size : Int = 0
    var root : Node<T>?
    public init() {
        
    }    
    /// 元素数量
    func Size() ->Int{
        return size
    }
    
    /**
     * 是否为空
     */
    func isEmpty()->Bool {
        return Size() == 0;
    }

    /**
     * 清空所有的元素
     */
    func clear() {
        root = nil;
        size = 0;
    }
    
    func test() -> String {
        return "BinaryTreeTest"
    }
    
//    open func afterRemove(node:Node<T>?){}

    //创建一个节点
    func createNode(_ value : T ,_ parent : Node<T>?) -> Node<T>{
        return Node<T>(value:value,parent:parent)
    }
}
//MARK:- 遍历
extension BinaryTree{
     //前序遍历 前序（Pre-order）：首先查看节点本身，然后查看其左右子节点。
     public func preOrderTraversal(){
         preOrderTraversal(node: root)
     }
     private func preOrderTraversal(node : Node<T>?) -> Void {
         if node == nil {
             return
         }
         print("\(node!.value!)" + " ")  //查看自己
         
         preOrderTraversal(node: node?.left) //查看左子节点
         
         preOrderTraversal(node: node?.right) //查看右子节点
     }
     
     //中序（或 深度优先，In-order/depth-first）：首先查看节点的左子节点，然后查看节点本身，最后查看其右子节点。
     public func inOrderTraversal(){
         inOrderTraversal(node: root)
     }
     private func inOrderTraversal(node : Node<T>?) -> Void {
        if node == nil {
            return
        }
         inOrderTraversal(node: node?.left) //查看左子节点

         print("\(node!.value!)" + " ") //查看自己的值
         
         inOrderTraversal(node: node?.right) //查看右子节点
    }


      //后序（Post-order）：首先查看左右子节点并最后处理节点本身。
      public func postOrderTraversal(){
          postOrderTraversal(node: root)
      }
      private func postOrderTraversal(node : Node<T>?) -> Void {
         if node == nil {
             return
         }
         postOrderTraversal(node: node?.left) //查看左子节点
         postOrderTraversal(node: node?.right) //查看右子节点
         print("\(node!.value!)" + " ") //查看自己的值

     }
    
    func levelOrder(_ root: Node<T>?) -> [[T]]{
         guard root != nil else {
            return []
        }
        var lastRes = [[T]]()
        
        var res = [T]()
        var queue = [Node<T>]()
        queue.append(root!)
        var levelSize = 1 //存储每次的元素数量 数组的count

        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelSize -= 1
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
            res.append(node.value)
            if levelSize == 0 {
                levelSize = queue.count
                lastRes.append(res)
                res.removeAll()
            }
        }
        return lastRes
    }

}
//高度
extension BinaryTree{
    //递归
    public func height1() -> Int {
        return height1(node: root)
    }
    private func height1(node:Node<T>?) -> Int {
        if node == nil {
            return 0
        }
        return 1 + max(height1(node: node?.left), height1(node: node?.right));
    }
    
    //迭代
    public func height2() -> Int {
        return height2(node: root)
    }
    private func height2(node:Node<T>?) -> Int {
        if node == nil {
            return 0
        }
        var levelSize = 1 //存储每次的元素数量 数组的count
        var height = 0
        var queue = [Node<T>]() //队列数组
        queue.append(root!)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            levelSize -= 1 //数据从数组中移除就 减1
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
            if levelSize == 0 {
                levelSize = queue.count
                height += 1
            }
            
        }
        return height
        
    }
}
//MARK:- 宽度
extension BinaryTree{
    public func width()-> Int{
        return widthOfBinaryTree(node: root)
    }
    func widthOfBinaryTree(node:Node<T>?) -> Int {
        if root == nil {
            return 0
        }
        var queue : [Node<T>] = [root!] //队列数组
        var list : [Int] = [1]
        var res = 1 //存储每次的元素数量 数组的count
        while !queue.isEmpty {
            let count = queue.count
            for _ in 0..<count{
                let cur = queue.removeFirst()
                let curIndex = list.removeFirst()
                if cur.left != nil {
                    queue.append(cur.left!)
                    list.append(curIndex * 2)
                    
                }
                if cur.right != nil {
                    queue.append(cur.right!)
                    list.append(curIndex * 2 + 1)
                }
                var s = "list:["
                for i in 0..<list.count{
//                    print(list[i])
                    s += "\(list[i]),"
                }
                
                print(s + "]")
            }
            if list.count >= 2 {
                res = max(res, list.last! - list.first! + 1)
                print("最大宽度：\(res)")
            }
            
        }
        return res
    }
}
//MARK:- 判断是否为完全二叉树
extension BinaryTree {
    //是否为完全二叉树
    func isComplete() -> Bool {
        if root == nil {
            return false
        }
        var queue = [Node<T>]()
        queue.append(root!)
        
        var leaf : Bool = false
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if leaf && !node.isLeaf {
                return false
            }
            if let left = node.left {
                queue.append(left)
            }else if node.right != nil{
                return false
            }
        
            if let right = node.right{
                queue.append(right)
            }else{
                leaf = true
            }
        }
        return true
    }
}
//MARK:- 前驱节点 和 后继节点
extension BinaryTree{
    //前驱
    func predecessor(node : Node<T>?) -> Node<T>?{
        var node = node
        
        if node == nil {
            return nil
        }
        //前驱节点在左子树中（left.right.right.right...）
        if node?.left != nil {  //左子树不为空，则找到它的最右节点
            var p = node?.left
            while p?.right != nil {
                p = p?.right
            }
            return p
        }
        //能来这边就说明 左子树为空
        //当父节点不为空，则顺着父节点找，一直到 节点为父节点的右节点 时
        while node?.parent != nil && node?.parent?.left == node {
            node = node?.parent
        }
        //node.parent == nil 无前驱
        //node.parent.right == node 该节点为根节点的右节点
        return node?.parent
        
    }
    
    //后继
    func successor(node : Node<T>?) -> Node<T>?{
        var node = node
        
        if node == nil {
            return nil
        }
        //前驱节点在左子树中（right.left.left.left...）
        if node?.right != nil {  //左子树不为空，则找到它的最右节点
            var p = node?.right
            while p?.left != nil {
                p = p?.left
            }
            return p
        }
        //能来这边就说明 左子树为空
        //当父节点不为空，则顺着父节点找，一直到 节点为父节点的右节点 时
        while node?.parent != nil && node?.parent?.right == node {
            node = node?.parent
        }
        //node.parent == nil 无前驱
        //node.parent.left == node 该节点为根节点的左节点
        return node?.parent
        
    }

}

