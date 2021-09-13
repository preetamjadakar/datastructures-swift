public struct HashTable<Key: Hashable, Value> {
    private typealias Element = (key: Key, value: Value)
    private typealias Bucket = [Element]
    private var buckets: [Bucket]

    /// The number of key-value pairs in the hash table.
    private(set) public var count = 0 //public-get and private set

    /// A Boolean value that indicates whether the hash table is empty.
    public var isEmpty: Bool { return count == 0 }

    /**
     Create a hash table with the given capacity.
     */
    public init(capacity: Int) {
        assert(capacity > 0)
        buckets = Array<Bucket>(repeatElement([], count: capacity))
    }

    /**
     Accesses the value associated with
     the given key for reading and writing.
     */
    public subscript(key: Key) -> Value? {
        get {
            return value(forKey: key)
        }
        set {
            if let value = newValue {
                updateValue(value, forKey: key)
            } else {
                removeValue(forKey: key)
            }
        }
    }

    /**
     Returns the value for the given key.
     */
    public func value(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)
        for element in buckets[index] {
            if element.key == key {
                return element.value
            }
        }
        return nil  // key not found in hash table
    }

    /**
     Updates the value stored in the hash table for the given key,
     or adds a new key-value pair if the key does not exist.
     */
    @discardableResult public mutating func updateValue(_ value: Value, forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Do we already have this key in the bucket?
        var bucket = buckets[index]
        for (i, element) in bucket.enumerated() {
            if element.key == key {
                let oldValue = element.value
                bucket[i].value = value
                return oldValue
            }
        }

        // This key isn't in the bucket yet; add it to the chain.
        buckets[index].append((key: key, value: value))
        count += 1
        return nil
    }

    /**
     Removes the given key and its
     associated value from the hash table.
     */
    @discardableResult public mutating func removeValue(forKey key: Key) -> Value? {
        let index = self.index(forKey: key)

        // Find the element in the bucket's chain and remove it.
        for (i, element) in buckets[index].enumerated() {
            if element.key == key {
                buckets[index].remove(at: i)
                count -= 1
                return element.value
            }
        }
        return nil  // key not in hash table
    }

    /**
     Removes all key-value pairs from the hash table.
     */
    public mutating func removeAll() {
        buckets = Array<Bucket>(repeatElement([], count: buckets.count))
        count = 0
    }

    /**
     Returns the given key's array index.
     */
    private func index(forKey key: Key) -> Int {
        return abs(key.hashValue % buckets.count)
    }
}

extension HashTable: CustomStringConvertible {
    /// A string that represents the contents of the hash table.
    public var description: String {
        let pairs = buckets.flatMap { b in b.map { e in "\(e.key) = \(e.value)" } }
        return pairs.joined(separator: ", ")
    }
    
    /// A string that represents the contents of
    /// the hash table, suitable for debugging.
    public var debugDescription: String {
        var str = ""
        for (i, bucket) in buckets.enumerated() {
            let pairs = bucket.map { e in "\(e.key) = \(e.value)" }
            str += "bucket \(i): " + pairs.joined(separator: ", ") + "\n"
        }
        return str
    }
}


"firstName".hashValue
abs("firstName".hashValue) % 5

"lastName".hashValue
abs("lastName".hashValue) % 5

"hobbies".hashValue
abs("hobbies".hashValue) % 5

// Playing with the hash table
var hashTable = HashTable<String, String>(capacity: 5)

hashTable["firstName"] = "Rio"
hashTable["lastName"] = "Herran"
hashTable["hobbies"] = "Programming"

print(hashTable)
print(hashTable.debugDescription)

let x = hashTable["firstName"]
hashTable["firstName"] = "Tim"

let y = hashTable["firstName"]
hashTable["firstName"] = nil

let z = hashTable["firstName"]

print(hashTable)
print(hashTable.debugDescription)
