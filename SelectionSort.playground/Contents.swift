import UIKit

// find the smallest item in the array and swap with first index
//Time Complexity
//Best: O(n^2)
//Worst and average: O(n^2)
var dataArray = [6, 1, 9, 5, 13, 6, 99, 19, 58, 0]
var minIndex = 0
var minNumber = dataArray[minIndex]
print("Array before sorting:", dataArray)

for i in 0..<dataArray.count {
    minIndex = i
    for j in (i+1)..<dataArray.count {
        if dataArray[j] < dataArray[minIndex] {
            minIndex = j
        }
        dataArray.swapAt(i, minIndex)
    }
}
print("Array after sorting:", dataArray)
