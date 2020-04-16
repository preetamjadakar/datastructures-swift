import UIKit

//check next is less than or not if yes, place it to the correct deserving possition
// Best: O(n)
// Worst: O(n^2)
var dataArray = [6, 1, 9, 5, 13, 6, 99, 19, 58, 33, 1]

print("Array before sorting:", dataArray)
for i in 0..<dataArray.count {
    
    let key = dataArray[i]
    var j = i - 1
    while j >= 0 && key < dataArray[j]{
         dataArray[j + 1] =  dataArray[j]
        j -= 1
    }
    
    dataArray[j + 1] = key
}
print("Array after sorting:", dataArray.sorted())

