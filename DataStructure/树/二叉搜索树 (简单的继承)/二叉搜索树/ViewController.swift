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
        testTree1()
    }
    func testTree1() {
        let IntArr = [7,4,9,2,5,8,11,3,12,1]
        let tree2 = BinarySearchTreeNew<Int>(IntArr)
    }

}

