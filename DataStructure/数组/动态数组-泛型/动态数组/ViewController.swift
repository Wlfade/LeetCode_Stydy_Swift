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
        
//        let list : ArrayList = ArrayList<Person>(maxSize: 10, defaultValue: Person(10,"hah"))
        let p = Person(11,"kka");
        let p1 = Person(12,"kka1");
        let p2 = Person(13,"kka2");

        let list : ArrayList2 = ArrayList2<Person>(capacity: 10, defaultValue: p)
        list.add(p1)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)
        list.add(p2)

        list.remove(0)
        list.remove(0)
        list.remove(0)
        list.remove(0)
        list.remove(0)
        list.remove(0)
    }


}

