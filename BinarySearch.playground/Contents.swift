func binarySearch<T:Comparable>(list:[T], key:T)->Int?{
    var startIndex = 0
    var endIndex = list.count
    while startIndex < endIndex {
        let midIndex = startIndex + (endIndex - startIndex)/2
        if list[midIndex] == key {
            return midIndex
        } else if list[midIndex] < key {
            startIndex = midIndex + 1
        } else {
            endIndex = midIndex
        }
    }
    return nil
}

var names = ["John", "Peter", "Zack", "adam", "Tim", "Steve"]
names.sort()

print(names)

let nm = "Peter"
if let position = binarySearch(list:names, key:nm){
    print("\(nm) position is \(position)")
} else {
    print("not Found")
}

