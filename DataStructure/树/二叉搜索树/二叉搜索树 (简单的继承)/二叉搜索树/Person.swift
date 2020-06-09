//
//  Person.swift
//  二叉搜索树
//
//  Created by 王玲峰 on 5/29/20.
//  Copyright © 2020 王玲峰. All rights reserved.
//

import UIKit

class Person{
    var name : String?
    var age : Int = 0
    
    init(name:String,age:Int) {
        self.name = name
        self.age = age
    }
}
extension Person : Comparable{
    static func ==(m1:Person,m2:Person) -> Bool{
//        return m1.name == m2.name && m1.age == m2.age
        return m1.age == m2.age

    }
    //具体逻辑就忽略不实现了，很简单，具体业务，具体实现
    static func <= (m1:Person,m2:Person) -> Bool{
        return m1.age <= m2.age
    }
    static func < (m1:Person,m2:Person) -> Bool{
        return m1.age < m2.age
    }
    static func >= (m1:Person,m2:Person) -> Bool{
        return m1.age >= m2.age
    }
    static func > (m1:Person,m2:Person) -> Bool{
        return m1.age > m2.age
    }
    
}
extension Person : CustomStringConvertible{
    var description: String {
        return "name:\(name ?? ""),age:(\(age)"
    }
    
    
}
