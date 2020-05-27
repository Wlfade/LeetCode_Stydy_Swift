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
        
        for i in 0...5 {
            queue.enQueueFront("\(i)")
        }
        print("对头入队：\(queue.description)")
        
        for i in 0...5 {
             queue.enQueueRear("\(i)")
         }
         print("队尾入队：\(queue.description)")
        
        for _ in 0...3{
            print(queue.deQueueFront())
        }
        print("队头出队：\(queue.description)")
        
        for _ in 0...3{
            print(queue.deQueueRear())
        }
        print("队尾出队：\(queue.description)")
    }


}

