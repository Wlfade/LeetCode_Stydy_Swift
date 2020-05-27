//
//  ViewController.swift
//  Queue
//
//  Created by 王玲峰 on 5/26/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let queue = Queue<String>()
        
        for i in 0...10 {
            queue.enQueue("\(i)")
        }
        print("入队：\(queue.description)")
        
        for _ in 0...3{
            print(queue.deQueue())
        }
        print("出队：\(queue.description)")

 
    }


}

