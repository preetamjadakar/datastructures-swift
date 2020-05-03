// Problem - Statement
// Given 2 arrays, create a function that let's a user know (true/false) whether these two arrays contain any common items
//For Example:
//const array1 = ['a', 'b', 'c', 'x']
//const array2 = ['z', 'y', 'i']
//should return false.
//-----------
let array1 = ["a", "b", "c", "x"]
let array2 = ["z", "y", "x"]
//should return true.

//Approach #1

func containsCommonItem(_ array1:[String], _ array2:[String]) -> Bool {
    for itemInArray1 in array1 {
        for itemInArray2 in array2 {
            if itemInArray1 == itemInArray2 {
                return true
            }
        }
    }
    return false
}

print(containsCommonItem(array1, array2))
///Explanation: time complexity is not good for long array
//Time complexity - O(a*b), as it's a nesting of for-loops
//Space Complexity - O(1), as we're not storing anything except the iterator variables so O(1 + 1) is close to O(1)

// Approach #2
let array3 = ["aa", "aa", "bb", "cc", "xx"]
let array4 = ["zz", "yy", "xdx"]

func containsCommonItem2(_ array1:[String], _ array2:[String]) -> Bool {
    // loop through first array and create object where properties == items in the array
    var map = [String:Bool]()
    array3.forEach { (array3Item) in
        map[array3Item] = true
    }
    // loop through second array and check if item in second array exists on created object.
    for array4Item in array4 {
        if map[array4Item] ?? false {
            return true
        }
    }
    return false
}
print(containsCommonItem2(array3, array4))
///Explanation: time complexity is the best in this case
//Time complexity - O(a + b), as it is a loop-after-loop
//Space Complexity - O(a), as we're creating a hash map and the iterator variable so O(a + 1) which is close to O(a)

// Approach #3
func containsCommonItem3(_ array1:[String], _ array2:[String]) -> Bool {
    return array1.map{ array2.contains($0)}.contains(true)
}

print(containsCommonItem3(array3, array4))
///Explanation: this is best for redability.
// if the array count is less, we should go for this solution because the readability is greater and perfornce cost of nested solution is acceptable for small count of array
//Time complexity - O(a * b), as it's a nesting of for-loops under the hood
//Space Complexity - O(1), as we're not storing anything except the iterator variable so O(1)
