//
//  ViewController.swift
//  CircleQueue
//
//  Created by 王玲峰 on 5/27/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        test1()
        test2()
    }
    func test1(){
        let circleQueue = CircleQueue<Int>(defaultValue: -1)
        for i in 1...10 {
            circleQueue.enQueue(element: i)
        }
        print(circleQueue.description())
        
        for _ in 0..<5{
            print(circleQueue.deQueue() as Any)
        }
        print(circleQueue.description())

        print(circleQueue.getFront())
    }


    func test2(){
        let circleQueue = CircleDequeue<Int>(defaultValue: -1)
        for i in 1...10 {
            circleQueue.enQueueFront(element: i)
            circleQueue.enQueueRear(element: i + 100)

        }
        print(circleQueue.description())
        
        for _ in 0..<3{
            print(circleQueue.deQueueRear() as Any)
            print(circleQueue.deQueueFront() as Any)

        }
        print(circleQueue.description())
//        print(circleQueue.getFront())
//        print(circleQueue.rear())
    }

}

