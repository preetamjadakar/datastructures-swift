import UIKit
// check if adjusant elements are in the order if not swap with each other
// Best: O(n)
// Worst: O(n^2)
var dataArray = [6, 1, 9, 5, 13, 6, 99, 19, 58, 33]

print("Array before sorting:", dataArray)
for i in 0..<dataArray.count {
    for j in 0..<dataArray.count {
        if dataArray[i] < dataArray[j] {
            let temp = dataArray[i]
            dataArray[i] = dataArray[j]
            dataArray[j] = temp
        }
    }
}
print("Array after sorting:", dataArray)
