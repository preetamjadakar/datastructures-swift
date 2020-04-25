
func mergeSortedArrays(_ array1:[Int], _ array2:[Int]) -> [Int] {
    var mergedArray = [Int]()
    if array1.count == 0 {
        return array2
    }
    if array2.count == 0 {
        return array1
    }
    
    var item1InArray1:Int? = array1[0]
    var item1InArray2:Int? = array2[0]
    var i = 1
    var j = 1
    while (item1InArray1 != nil) || (item1InArray2 != nil) {
        if item1InArray1 == nil {
            mergedArray.append(item1InArray2!)
            if j < array2.count {
                item1InArray2 = array2[j]
                j += 1
            } else {
                item1InArray2 = nil
            }
            continue
        }
        if item1InArray2 == nil {
            mergedArray.append(item1InArray1!)
            if i < array1.count {
                item1InArray1 = array1[i]
                i += 1
            } else {
                item1InArray1 = nil
            }
            continue
        }
        if item1InArray1! <= item1InArray2! {
            mergedArray.append(item1InArray1!)
            if i < array1.count {
                item1InArray1 = array1[i]
                i += 1
            } else {
                item1InArray1 = nil
            }
        } else {
            mergedArray.append(item1InArray2!)
            if j < array2.count {
                item1InArray2 = array2[j]
                j += 1
            } else {
                item1InArray2 = nil
            }
        }
    }
    return mergedArray
}

print(mergeSortedArrays([0, 3, 10, 15, 20], [1, 5, 12, 19, 25, 30, 50]))
