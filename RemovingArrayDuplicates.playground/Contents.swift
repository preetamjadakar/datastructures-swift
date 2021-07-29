import UIKit

var str = "Hello, playground"


//[1,1,2,3] => 3


func removeDuplicates1(_ nums: inout [Int]) -> Int {
    var uniqArray = [Int]()
    for number in nums {
        if uniqArray.last != number {
            uniqArray.append(number)
        }
    }
    print(uniqArray)
    return uniqArray.count
}
var intArray = [1, 1, 2, 3]
removeDuplicates1(&intArray)

func removeDuplicates2(_ nums: inout [Int]) -> Int {
    var arrayIterator = 0
    for i in 0..<nums.count-1 {
        if nums[i] == nums[i+1] {
//            nums.swapAt(i, i+1)
            nums[i] = -1
            arrayIterator += 1
        }
        
    }
    return nums.count - arrayIterator
}

var givenArray = [1,2,2,3,4,4,4,5,6,6,6,6,6,7]
let result = removeDuplicates2(&givenArray)
print(givenArray.filter({ (number) -> Bool in
    return number != -1
}))


//let uniques = Array(Set(intArray))
let uniques = NSOrderedSet.init(array: intArray).array
print(uniques)

//MARK: Using hashtable
func removeDuplicates3(_ nums: inout [Int]) -> Int {
    var uniqDictionry = [Int:Int]()
    var count:Int = 0
    for number in nums {
        uniqDictionry[number] = 0
        count += 1
    }
    for key in uniqDictionry.keys {
        print(key)
    }
    print(uniqDictionry.keys)
    return uniqDictionry.keys.count
}

removeDuplicates3(&intArray)

//MARK: remove in one iteration
var intArray2 = [1, 1, 2, 2, 3]
func removeDuplicates4(_ nums: inout [Int]) -> Int {
    var index = 0
    while index < nums.count {
        if index > 0 && nums[index] == nums[index - 1] {
            nums.remove(at: index)
        } else {
            index += 1
        }
    }
    return nums.count
}
removeDuplicates4(&intArray2)

///Given a sorted array, you need to remove recurring elements so that each element appears only once, returning the new length of the removed array.

///Don't use extra array space, you have toModify the input array do with O(1) extra space.

func removeDuplicates5(_ nums: inout [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    var i = 0
    for j in 0...nums.count-1 {
        if nums[i] != nums[j]{ //0-0[0-0],0-1[0,1], 1-2[1,1], 1-3[1,3],2-4[3, 4], 3-5[4,4], 3-6[4,5]
            i += 1//1,2,3,4
            print(nums)
            nums[i] = nums[j]//[0,1,3, 4, 5]
        }
    }
    return i+1
}

var integerArray = [0, 1, 1, 3, 4, 4, 5, 5, 5, 6]
removeDuplicates5(&integerArray)
