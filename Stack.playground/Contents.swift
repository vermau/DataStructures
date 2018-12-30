
/*
 - Stack implementation as a Struct using an array inside
 - Tutorial followed from Swift Algorithm Club on www.raywenderlich.com
 - Created by Ujjwal Verma
 - Created on Aug 19, 2017
 */

import Foundation

public struct Stack<T> {
    fileprivate var arr: [T] = []
    
    public var isEmpty: Bool {
        return arr.isEmpty
    }
    
    public var count: Int {
        return arr.count
    }
    
    public mutating func push(element e: T) {
        arr.append(e)
    }
    
    public mutating func pop() -> T? {
        if isEmpty {
            return nil
        } else {
            return arr.popLast()
        }
    }
    
    public var top: T? {
        if isEmpty {
            return nil
        } else {
            return arr.last
        }
    }
}

extension Stack: CustomStringConvertible {
    public var description: String {
        let header = "----- Stack -----\n"
        let footer = "\n-----------------\n"
        
        let stackElements = arr.map { "\($0)"}.reversed().joined(separator: "\n")
        
        return header + stackElements + footer
    }
}

// Creating a Stack now
var s = Stack<Int>()
s.push(element: 10)
s.push(element: 20)
s.push(element: 30)
s.push(element: 40)

print(s)

for counter in 1...s.count {
    if let element = s.top {
        print("\(counter): \(element)")
        _ = s.pop() // pop out the top element
    }
}

