//
//  Person.swift
//  动态数组
//
//  Created by 单车 on 2020/5/18.
//  Copyright © 2020 单车. All rights reserved.
//

import UIKit

class Person: NSObject {
    var age:Int = 0
    var name : String?
    
    init(_ age:Int , _ name: String){
        super.init()
        self.age = age
        self.name = name
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        let person = object as? Person
        return self.age == person?.age
    }
}
