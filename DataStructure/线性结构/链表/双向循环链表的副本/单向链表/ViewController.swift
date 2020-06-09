//
//  ViewController.swift
//  单向链表
//
//  Created by 单车 on 2020/5/20.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let list = SingleLinkedList<String>()
        for i in 1...8 {
            var n = 2            
            while n>0 {
                list.next()
                n -= 1
            }
            list.append("\(i)")
        }
        //约瑟夫 问题
        list.reset() //current 指向头结点
        while list.Size() != 0 {
            list.next()
            list.next()
            print(list.remove())
        }
    }


}

