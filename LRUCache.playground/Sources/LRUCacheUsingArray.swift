import Foundation

public class Cache<keyType: Hashable> {
    private let maxSize:Int!
    private var hashTable = [keyType:Any]()
    private var queue = [keyType]()
    
    public init(maxSize: Int) {
        self.maxSize = maxSize
    }
    
    public func get(_ key:keyType) -> Any? {
        guard let value = hashTable[key] else {
            return nil
        }
        queue.removeAll { (keyIterator) -> Bool in
            return keyIterator == key
        }
        queue.append(key)
        return value
    }
    
    public func set(_ key:keyType, _ value:Any) {
        if queue.count < maxSize {
           
        } else {
           let keyToPurgeItem = queue.remove(at: 0)
            hashTable.removeValue(forKey: keyToPurgeItem)
        }
        hashTable[key] = value
        queue.append(key)
    }
}
