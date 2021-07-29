
func mergeSortedArrays(_ array1:[Int], _ array2:[Int]) -> [Int] {
    var mergedArray = [Int]()
    if array1.count == 0 {
        return array2
    }
    if array2.count == 0 {
        return array1
    }
    
    var array1IteratorValue:Int? = array1[0]
    var array2IteratorValue:Int? = array2[0]
    var i = 1
    var j = 1
    while (array1IteratorValue != nil) || (array2IteratorValue != nil) {
        if array1IteratorValue == nil {
            mergedArray.append(array2IteratorValue!)
            if j < array2.count {
                array2IteratorValue = array2[j]
                j += 1
            } else {
                array2IteratorValue = nil
            }
            continue
        }
        if array2IteratorValue == nil {
            mergedArray.append(array1IteratorValue!)
            if i < array1.count {
                array1IteratorValue = array1[i]
                i += 1
            } else {
                array1IteratorValue = nil
            }
            continue
        }
        if array1IteratorValue! <= array2IteratorValue! {
            mergedArray.append(array1IteratorValue!)
            if i < array1.count {
                array1IteratorValue = array1[i]
                i += 1
            } else {
                array1IteratorValue = nil
            }
        } else {
            mergedArray.append(array2IteratorValue!)
            if j < array2.count {
                array2IteratorValue = array2[j]
                j += 1
            } else {
                array2IteratorValue = nil
            }
        }
    }
    return mergedArray
}

print(mergeSortedArrays([0, 3, 10, 15, 20], [1, 5, 12, 19, 25, 30, 50]))
