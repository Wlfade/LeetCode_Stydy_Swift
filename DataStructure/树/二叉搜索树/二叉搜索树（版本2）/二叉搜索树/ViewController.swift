//
//  ViewController.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 5/29/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        testTree1()
//        testTree2()
//        testTree3()
//        testTree4()


    }
    func testTree1() {
        
        let p1 = Person(name: "p1", age: 11)
        let p2 = Person(name: "p2", age: 12)
        print(p1>p2)
        
        
        
        
        var arr = [Person]()
        let IntArr = [7,4,9,2,5,8,11,3,12,1]
        
        for i in 0..<IntArr.count {
            arr.append(Person(name:"\(IntArr[i])",age:IntArr[i]))
        }
//        let tree1 = BinarySearchTree<Person>(array: arr)
//        print(tree1)
        
        let tree2 = BinarySearchTree<Int>(array: IntArr)

        
//        tree2.flatten()
        
        print(tree2.predecessor(element: 4) as Any)

        
        
        
    }
    func testTree2(){
//        Solution<Int>.buildTree([3,9,20,15,7], [9,3,15,20,7])

    }
    func testTree3(){
//        print(Solution<Int>.buildTree1([3,9,15,20,7], [9,15,7,20,3]))

    }
    func testTree4(){
//        print(Solution<Int>.constructFromPrePost([1,2,4,5,3,6,7], [4,5,2,6,7,3,1]))

    }

}
