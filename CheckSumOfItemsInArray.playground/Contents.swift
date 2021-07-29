// Problem - Statement
// Given a array and a number, create a function that let's a user know (true/false) whether any of the array element pair has sum equal to the given  sum of given number
//For Example:
//let array = [6, 4, 3, 2, 1, 7]
//let sum = 20
//should return false.
//-----------
let array = [6, 4, 3, 2, 1, 7]
let sum = 9
//should return true.

//Approach #1
func hasPairWithSum(_ sum: Int, array:[Int]) -> Bool {
    for item1InArray in array {
        for item2InArray in array {
            if item1InArray + item2InArray == sum {
                return true
            }
        }
    }
    return false
}

print(hasPairWithSum(20, array: array))
///Explanation: time complexity is not good for long array
//Time complexity - O(n*n)=O(n^2), as it's a nesting of for-loops
//Space Complexity - O(1), as we're not storing anything except the iterator variables so O(1 + 1) is close to O(1)

//Approach #2
func hasPairWithSum2(_ sum: Int, array:[Int]) -> Bool {
    //create a set with difference of each array item and sum variable
    var set = Set<Int>()
    
    for itemInArray in array {
        if set.contains(itemInArray) {
            return true
        }
        //check if the difference is same as array element
        set.insert(sum - itemInArray)
    }
    return false
}
print(hasPairWithSum2(20, array: array))
///Explanation: time complexity is the best in this case
//Time complexity - O(n), as it is a for-loop
//Space Complexity - O(n), as we're creating a set and the iterator variable so O(n + 1) which is close to O(n)
