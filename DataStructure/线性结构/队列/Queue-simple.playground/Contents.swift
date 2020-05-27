import UIKit

public struct Queue<T>{
    fileprivate var array = [T]()
    
    public var count : Int{
        return array.count
    }
    
    public var isEmpty : Bool{
        return array.isEmpty
    }
    
    public mutating func enqueue(_ element:T){
        array.append(element)
    }
    public mutating func dequeue(_ element:T) -> T?{
        if isEmpty {
            return nil
        }else{
            return array.removeLast()
        }
    }
    
    public var front:T?{
        return array.first
    }
    
}
