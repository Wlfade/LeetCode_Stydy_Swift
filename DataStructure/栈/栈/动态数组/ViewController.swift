//
//  ViewController.swift
//  动态数组
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        let stack : Stack = Stack<String>()
        for i in 1...4 {
            print("\(i)")
            stack.push(element: "\(i)")
        }
        while !stack.isEmpty() {
            print("pop:\(stack.pop())")
        }
        
    }
}

