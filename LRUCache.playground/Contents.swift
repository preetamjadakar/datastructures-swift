//
//  LRUCache.swift
//
//
//  Created by Preetam Jadakar on 02/02/2021.
//
//

let listCache = LRUCache<String>(2)
listCache.set("a", val: 1)
listCache.set("b", val: 2)
listCache.get("a") // returns 1
listCache.set("c", val: 3) // evicts key "b"
listCache.get("b") // returns nil (not found)
listCache.set("d", val: 4) // evicts key "a"
listCache.get("a") // returns nil (not found)
listCache.get("c") // returns 3
listCache.get("d") // returns 4



let arrayCache = Cache<String>.init(maxSize: 2)
arrayCache.set("a", 1)
arrayCache.set("b", 2)
arrayCache.set("c", 3)
arrayCache.get("c")
arrayCache.set("d", 4)

