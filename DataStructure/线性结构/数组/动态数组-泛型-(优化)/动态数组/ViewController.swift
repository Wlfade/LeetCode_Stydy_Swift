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
        
        let p = Person(11,"kka");
        let p1 = Person(12,"kka1");
        let p2 = Person(13,"kka2");

        let list : ArrayList2 = ArrayList2<String>(capacity: 10, defaultValue: "0")
        for i in 1...30 {
            list.add("\(i)")
        }
        
        list.printArrlist()
    }


}

