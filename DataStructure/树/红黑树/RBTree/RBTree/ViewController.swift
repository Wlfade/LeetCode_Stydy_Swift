//
//  ViewController.swift
//  RBTree
//
//  Created by 王玲峰 on 6/5/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            testTree1()
        }
    func testTree1() {
        let IntArr = [19,69,3,7,99,95]
        let tree2 = RBTree<Int>(IntArr)
        print(tree2.test())
        tree2.remove(element: 95)
        tree2.remove(element: 7)
        tree2.remove(element: 3)

    }



}

