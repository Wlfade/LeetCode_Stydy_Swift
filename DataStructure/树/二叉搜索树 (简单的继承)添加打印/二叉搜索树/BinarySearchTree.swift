//
//  BinarySearchTree.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 5/29/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit


class BinarySearchTree<T: Comparable>{
    private var size : Int = 0
    private var root : Node<T>?
    public init() {
        
    }
    /// 以数组的方式初始化
    public convenience init(array: [T]) {
        precondition(array.count > 0)
        self.init()
        for v in array {
            add(value: v)
        }
    }
    
    /// 元素数量
    public func Size() ->Int{
        return size
    }
    
    /**
     * 是否为空
     */
    public func isEmpty()->Bool {
        return Size() == 0;
    }

    /**
     * 清空所有的元素
     */
    public func clear() {
        root = nil;
        size = 0;
    }

}
//MARK:- 添加
extension BinarySearchTree {
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
}
//MARK:- 遍历
extension BinarySearchTree {
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
    
    //中序遍历
    public func inorderTraversal(){
        print(Solution.inorderTraversal(root))
    }
    //后序遍历
    public func postorderTraversal(){
        print(Solution.postorderTraversal(root))
    }

    //层次遍历
    public func levelOrderTraversal() -> [T]{
        return Solution.levelOrderTraversal(root)
    }
    
    //展开为链表
    public func flatten(){
        Solution.flatten(root)
    }
}
//MARK:- 高度
extension BinarySearchTree{
    public func height1() -> Int {
        return height1(node: root)
    }
    func height1(node:Node<T>?) -> Int {
        if node == nil {
            return 0
        }
        return 1 + max(height1(node: node?.left), height1(node: node?.right));
    }
    
    
    public func height2() -> Int {
        return height2(node: root)
    }
    func height2(node:Node<T>?) -> Int {
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
extension BinarySearchTree {
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
extension BinarySearchTree{
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
    
    private func predecessor(node : Node<T>?) -> Node<T>?{
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

    
    private func successor(node : Node<T>?) -> Node<T>?{
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

//MARK:- 是否包含某个值 根据元素获取节点元素
extension BinarySearchTree{
    func contains(element : T) ->  Bool{
        return node(element: element) != nil
    }
    func node(element : T) -> Node<T>? {
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
    
    func elementNotNilCheck(element : T?)->Bool{
        if element == nil {
            print("element must not nil")
            return false
        }
        return true
    }
    
    func remove(element : T?){
        if(elementNotNilCheck(element: element) == false){
              return
            }
        let nod = node(element: element!)
        remove(node: nod)
    }
    func remove(node:Node<T>?){
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
}
//MARK:- 打印
extension BinarySearchTree{
    func levelOrderTree() -> [T]? {
        if root == nil {
            return nil
        }
        
        var levelArr:[T] = []
        var data:[Node<T>] = [root!]
        
        while data.count > 0 {
            let headNode:Node = data[0]
            data.remove(at: 0)
            levelArr.append(headNode.value!)
            
            if headNode.left != nil {
                data.append(headNode.left!)
            }
            
            if headNode.right != nil {
                data.append(headNode.right!)
            }
        }
        
        return levelArr
    }
}
