//
//  Solution.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 6/1/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        
    }
}

class Solution<T: Comparable> {
    func preorderTraversal(_ root: TreeNode?) -> [Int] {
         guard let root = root else { return [] }
        
         var res: [Int] = []
         var stack: [TreeNode] = [root]
        
         while let node = stack.popLast() {
             res.append(node.val)
             if let right = node.right { stack.append(right)}
             if let left = node.left { stack.append(left) }
         }
         return res
     }

    //中序遍历
    class func inorderTraversal(_ root: Node<T>?) -> [T] {
        var stack: [Node<T>] = []
        var result: [T] = []
        var node: Node<T>? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
                
                var s = "s = ["
                for i in 0..<stack.count{
                    s += "\(stack[i].value!), "
                }
                s += "]"
                print(s)
            }
            
            node = stack.popLast()
            result.append(node!.value)
            node = node?.right
        }
        print("result:"+"\(result)")
        return result
    }
    //后序遍历
    class func postorderTraversal(_ root: Node<T>?) -> [T] {
        var stack: [Node<T>] = []
        var result: [T] = []
        var node: Node<T>? = root
        
        while node != nil || !stack.isEmpty {
            while node != nil {
                stack.append(node!)
                node = node!.left
                
                var s = "s = ["
                for i in 0..<stack.count{
                    s += "\(stack[i].value!), "
                }
                s += "]"
                print(s)

            }
            let temp = stack.last!
            if temp.right == nil {
                //右边的节点为nil才赋值
                stack.removeLast()
                result.append(temp.value)
            }else{
                node = temp.right  //找到了这个节点的有节点之后 就把右节点置空
                temp.right = nil
            }
            
        }
        
        return result
    }

    //层次遍历
    class func levelOrderTraversal(_ root: Node<T>?) -> [T]{
        guard root != nil else {
            return []
        }
        var res = [T]()
        var queue = [Node<T>]()
        queue.append(root!)
        while !queue.isEmpty {
            let node = queue.removeFirst()
            if let left = node.left {
                queue.append(left)
            }
            if let right = node.right{
                queue.append(right)
            }
            res.append(node.value)
        }
        return res
    }
    
    //二维数组的层次遍历
    class func levelOrder(_ root: Node<T>?) -> [[T]]{
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


    //将树展开 变成链表
    class func flatten(_ root: Node<T>?) {
        var node = root
        
        guard  node != nil else {
            return
        }
        var i = 0
        while node != nil{
            i += 1
            print("循环:\(i)次")
            print(levelOrder(root))
            print("-----")

            if(node!.left == nil){
                node = node!.right
            }else{
                //找到左子树的最右侧节点
                var pre = node!.left!
                while pre.right != nil{
                    pre = pre.right!
                }
                //将原来的右子树接到左子树
                pre.right = node!.right
                //将左子树插入到右子树的地方
                node!.right = node!.left
                node!.left = nil

                //考虑到下个节点
                node = node!.right
            }
            print(levelOrder(node))
       }
        print("------")
        print(levelOrder(root))

    }

            
}

// 前序 遍历 根左右
// 下标 0 根
// 下标 (preStart + 1)-> （presStart + 1 + leftLen - 1） 左子树的下标范围
// 下标 (preEnd - rightLen + 1)-> （perEnd） 右子树的下标范围

// 中序 遍历 左根右
// 下标 pos 根
// 下标 (inStart)-> （inStart + leftLeng -1） 左子树的下标范围
// 下标 (inEnd - rightLen + 1)-> （inEnd） 右子树的下标范围

////根据前序和中序 重构二叉树
//extension Solution{
//    //
//    class func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
//        if
//        preorder.count == 0 ||
//
//        inorder.count == 0{
//            return nil
//        }
//        return build(preorder, 0, preorder.count - 1, inorder, 0, inorder.count - 1)
//    }
//    private class func build(_ pre : [Int] , _ preStart : Int , _ preEnd : Int, _ In : [Int], _ inStart : Int, _ inEnd : Int) -> TreeNode?{
//        let root = TreeNode.init(pre[preStart])
//        let pos = findRoot(root.val, In, inStart, inEnd)
//        let leftlen = pos - inStart //左子树长度
//        let rightLen = inEnd - pos //右子树长度
//        if leftlen > 0 {
//            root.left = build(pre, preStart + 1, preStart + leftlen, In, inStart, inStart + leftlen - 1)
//        }
//        if rightLen > 0 {
//            root.right = build(pre, preEnd - rightLen + 1, preEnd, In, inEnd - rightLen + 1, inEnd)
//        }
//        return root
//
//    }
//    private class func findRoot(_ rootVal : Int ,_ In : [Int] ,_ inStart : Int , _ inEnd : Int)-> Int{
//        for i in inStart...inEnd {
//            if In[i] == rootVal {
//                return i
//            }
//        }
//        return -1
//    }
//
//}
//     后序 遍历  左右根
//     下标  end  根
//     下标  (postStart )-> （postStart + leftLen - 1） 左子树的下标范围
//     下标  (postEnd - rightLen + 1 - 1)-> （postEnd - 1）             右子树的下标范围

//     中序 遍历  左根右
//     下标  pos 根
//     下标  (inStart)-> （inStart + leftLeng -1） 左子树的下标范围
//     下标  (inEnd - rightLen + 1)-> （inEnd）               右子树的下标范围
////根据后序和中序 重构二叉树
//extension Solution{
//    //
//    class func buildTree1(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
//        if
//        postorder.count == 0 ||
//            
//        inorder.count == 0{
//            return nil
//        }
//        return build1(postorder, 0, postorder.count - 1, inorder, 0, inorder.count - 1)
//    }
//    private class func build1(_ post : [Int] , _ postStart : Int , _ postEnd : Int, _ In : [Int], _ inStart : Int, _ inEnd : Int) -> TreeNode?{
//        let root = TreeNode.init(post[postEnd])
//        let pos = findRoot1(root.val, In, inStart, inEnd)
//        let leftlen = pos - inStart //左子树长度
//        let rightLen = inEnd - pos //右子树长度
//        if leftlen > 0 {
//            root.left = build1(post, postStart , postStart + leftlen - 1, In, inStart, inStart + leftlen - 1)
//        }
//        if rightLen > 0 {
//            root.right = build1(post, postEnd - rightLen, postEnd - 1, In, inEnd - rightLen + 1, inEnd)
//        }
//        return root
//        
//    }
//    private class func findRoot1(_ rootVal : Int ,_ In : [Int] ,_ inStart : Int , _ inEnd : Int)-> Int{
//        for i in inStart...inEnd {
//            if In[i] == rootVal {
//                return i
//            }
//        }
//        return -1
//    }
//
//}

extension Solution{
    //
//    class func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
//        if
//        pre.count == 0 ||
//
//        post.count == 0{
//            return nil
//        }
//        return build(pre, 0, pre.count - 1, post, 0, post.count - 1)
//    }
//    private class func build(_ pre : [Int] , _ preStart : Int , _ preEnd : Int, _ post : [Int], _ postStart : Int, _ postEnd : Int) -> TreeNode?{
//        let root = TreeNode.init(pre[preStart])
//        if pre.count == 1 {
//            return root
//        }
//        let preLeftRoot = TreeNode.init(pre[preStart + 1])
//        let pos = findRoot(preLeftRoot.val, post, postStart, postEnd)
//        let leftlen = pos + 1 //左子树长度
//        let rightLen = (postEnd - 1) - pos //右子树长度
//        if leftlen > 0 {
//            root.left = build(pre, preStart + 1, preStart + leftlen, post, postStart, postStart + leftlen - 1)
//        }
//        if rightLen > 0 {
//            root.right = build(pre, preEnd - rightLen + 1, preEnd, post, postEnd - rightLen, postEnd - 1)
//        }
//        return root
//
//    }
//    private class func findRoot(_ rootVal : Int ,_ post : [Int] ,_ postStart : Int , _ postEnd : Int)-> Int{
//        for i in postStart...postEnd {
//            if post[i] == rootVal {
//                return i
//            }
//        }
//        return -1
//    }
    
    class func constructFromPrePost(_ pre: [Int], _ post: [Int]) -> TreeNode? {
        return helper(pre, post,0 , pre.count - 1, 0, post.count - 1)
    }
    class func helper(_ pre : [Int] ,_ post : [Int] , _ preStart : Int , _ preEnd : Int , _ postStart : Int , _ postEnd : Int) -> TreeNode? {
        if preStart > preEnd || postStart > postEnd {
            return nil
        }
        let root = TreeNode.init(pre[preStart])
        if(preStart + 1 > preEnd)
        {
            return root
        }
        let value = pre[preStart + 1]
        
        var index = postStart
        for i in postStart..<postEnd {
            if post[i] == value {
                index = i
            }
        }
        let length = index - postStart
        root.left = helper(pre, post, preStart + 1, postStart + length + 1, postStart, index)
        root.right = helper(pre, post, preStart + length + 2, preEnd, index + 1, postEnd - 1)
        return root
    }

}

