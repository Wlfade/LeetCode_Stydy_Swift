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
        let per1 = Person(10,"kak")
        let per2 = Person(11,"kd")
        let list = SingleLinkedList<Person>()
        list.append(Person(14,"kak44"))
        list.add(per2, at: 0)
        list.add(per1, at: 1)
            print(list)
//        print(list.Size())
        
//        let getNode = list.node(at: 1)
//        print(getNode.value.name as Any)
//        print(list.indexOf(per2))
        
//        print(list.removeLast())
        
        print(list.reverseList(list.head) as Any)
        print(list)

    }


}

