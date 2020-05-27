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
        let list : ArrayList = ArrayList(capacity:10)
        
        list.add(10)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)
        list.add(11)

        list.printArrlist()
        
 
    }


}

