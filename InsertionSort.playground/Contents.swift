//check next is less than or not if yes, place it to the correct deserving possition
// Time Complexity (Best): O(n) if data is already sorted
// Time Complexity (Worst): O(n^2)
// Space Complexity: O(1)

var dataArray = [6, 1, 9, 5, 13, 99, 19, 58, 33]

print("Array before sorting:", dataArray)
for i in 0..<dataArray.count {
    
    let key = dataArray[i]
    var j = i - 1
    while j >= 0 && dataArray[j] > key {
         dataArray[j + 1] =  dataArray[j]
        j -= 1
    }
    
    dataArray[j + 1] = key
}
print("Array after sorting:", dataArray)

