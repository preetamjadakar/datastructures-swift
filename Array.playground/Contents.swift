import UIKit

struct MyArray {
    var length:Int
    var data: [Int:String]
    init() {
        self.length = 0
        self.data = [:]
    }
    
    // get item at index
    func get(_ itemAtIndex:Int) -> String {
        guard let item = data[itemAtIndex] else {
            return "undefined value"
        }
        return item
    }
    
    //push the new item
    @discardableResult mutating func push(item:String) -> Int {
        data[self.length] = item
        defer {
            self.length += 1
        }
        return self.length
    }
    
    //pop the item
    @discardableResult mutating func pop() -> String? {
        //check if index is valid to avoid index out of range
        guard let index = data.index(forKey: self.length - 1) else {
            return nil
        }
        self.length -= 1
        return data.remove(at: index).value
    }
    
    //delete item at index
    @discardableResult mutating func delete(_ index:Int) -> String? {
        guard let itemToDelete = self.data[index] else {
            return nil
        }
        shiftIndices(index)
        return itemToDelete
    }
    
    private mutating func shiftIndices(_ fromIndex:Int) {
        for i in fromIndex..<self.length - 1 {
            self.data[i] = data[i+1]
        }
        //remove the last item
        self.pop()
    }
}

///This is just to print our custom data elegantly
extension MyArray: CustomStringConvertible {
    var description: String {
        //sorting is required as the default dictionary implementation is UNORDERED
        let sortedData = data.sorted {$0.key < $1.key}
        return "{\nlength: \(length) \ndata: \(sortedData)\n}"
    }
}

var array = MyArray()
print(array.get(0))

array.push(item: "first")
array.push(item: "second")
array.pop()
//array.pop()
//array.pop()
array.push(item: "third")
array.push(item: "fourth")
array.push(item: "fifth")
array.pop()
array.push(item: "sixth")
array.push(item: "seventh")
array.push(item: "eighth")
array.delete(0)
array.delete(3)
print(array)
