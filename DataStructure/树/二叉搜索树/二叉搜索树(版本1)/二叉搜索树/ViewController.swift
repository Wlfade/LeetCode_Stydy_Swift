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
    }
    func testTree1() {
        
        let p1 = Person(name: "p1", age: 11)
        let p2 = Person(name: "p2", age: 12)
        print(p1>p2)
        
        
        
        var arr = [Person]()
        let IntArr = [5,2,9,4,8,6,7]
        
        for i in 0..<IntArr.count {
            arr.append(Person(name:"\(IntArr[i])",age:IntArr[i]))
        }
        let tree1 = BinarySearchTree<Person>(array: arr)
        print(tree1)
        
        let tree2 = BinarySearchTree<Int>(array: IntArr)
        print(tree2)
        
         
        
    }


}

