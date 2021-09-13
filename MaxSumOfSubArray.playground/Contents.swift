import UIKit

///Approach #1: Kadanes’s algorithm

func maxSubArray(_ array: [Int]) -> Int {
    var currentSum = 0
    var result = Int.min
    for number in array {
        currentSum = number + result
        result = max(currentSum, number)
    }
    return result
}

let array = [5,4,-1,7,8]
maxSubArray(array)


///Approach #2: Dynamic programming

func maxSubArray2(_ array: [Int]) -> Int {
    guard array.count > 0 else {return 0}
    guard array.count > 1 else {return array[0]}

    var mem = Array(repeating: 0, count: array.count)
    mem[0] = array[0]

    for end in 1..<array.count {
        let newSum = mem[end-1] + array[end]
        mem[end] = max(array[end], newSum)
    }
    return mem.max() ?? 0
}
maxSubArray2(array)
