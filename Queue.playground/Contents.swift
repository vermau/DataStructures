
/*
 - Queue implementation as a Struct using an array inside
 - Tutorial followed from Swift Algorithm Club on www.raywenderlich.com
 - Created by Ujjwal Verma
 - Created on Aug 20, 2017
 */

import Foundation

public struct Queue<T> {
    private var arr = [T?]()
    private var head = 0
    
    public var isEmpty: Bool {
        return arr.isEmpty
    }
    
    public var count: Int {
        return arr.count - head
    }
    
    public mutating func enqueue(element e: T) {
        arr.append(e)
    }
    
    public mutating func dequeue() -> T? {
        guard head < count, let element = arr[head] else { return nil}
        
        arr[head] = nil
        head += 1
        
        // :Calculate %age of unused space in the array
        let percentageOfUnusedSpace = Double(head) / Double(arr.count)
        if percentageOfUnusedSpace > 0.25 {
            // :Reclaim memory from array. Removes all elements starting from first to head - 1
            arr.removeFirst(head)
            head = 0
        }
        return element
    }
    
    public var front: T? {
        if isEmpty {
            return nil
        } else {
            return arr[head]
        }
    }
}

// Creating a Queue now
var q = Queue<String>()
q.enqueue(element: "Alok Nath")
q.enqueue(element: "Amit Ghai")
q.enqueue(element: "Sunil Grover")
q.enqueue(element: "Mohit Kapila")
q.enqueue(element: "Kapil Sharma")
q.enqueue(element: "Anand Ghoshal")
q.enqueue(element: "Madan Sarang")

/*
 print(q.arr)
 print("Total elements in queue: \(q.count)")
 print()
 
 print("Taking out: \(q.dequeue()!)")
 print(q.arr)
 print("Elements left in queue: \(q.count)")
 print("Head: \(q.head)")
 print()
 
 print("Taking out: \(q.dequeue()!)")
 print(q.arr)
 print("Elements left in queue: \(q.count)")
 print("Head: \(q.head)")
 print()
 
 print("Taking out: \(q.dequeue()!)")
 print(q.arr)
 print("Elements left in queue: \(q.count)")
 print("Head: \(q.head)")
 print()
 */

for counter in 1...q.count {
    if let element = q.front {
        print("\(counter): \(element)")
        _ = q.dequeue() // deque one element from the front
    }
}
