//
//  ViewController.swift
//  Set(集合)
//
//  Created by 王玲峰 on 6/8/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        treeSet()

    }
    func listSet(){
        let listSet = ListSet<Int>()
        listSet.add(element: 10)
        listSet.add(element: 10)

        listSet.add(element: 11)
        listSet.add(element: 12)
        listSet.add(element: 13)
        listSet.add(element: 14)
        
        listSet.traversal()
    }
    
    func treeSet() {
        let treeSet = TreeSet<Int>()
         treeSet.add(element: 10)
        treeSet.add(element: 10)
        treeSet.add(element: 10)

         treeSet.add(element: 11)
         treeSet.add(element: 12)
         treeSet.add(element: 13)
         treeSet.add(element: 14)
         
         treeSet.traversal()
    }


}

