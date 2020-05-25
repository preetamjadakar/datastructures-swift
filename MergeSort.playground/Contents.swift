let numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0];

func mergeSort(_ array: [Int]) -> [Int] {
  if (array.count == 1) {
    return array
  }
  // Split Array in into right and left
    let mid = array.count/2
    let left = Array(array.prefix(upTo: mid))
    let right = Array(array.suffix(from: mid))
  return merge(mergeSort(left), mergeSort(right))
}

func merge(_ left: [Int], _ right: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0

    var orderedArray: [Int] = []
    
    while leftIndex < left.count && rightIndex < right.count {
      let leftElement = left[leftIndex]
      let rightElement = right[rightIndex]

      if leftElement < rightElement {
        orderedArray.append(leftElement)
        leftIndex += 1
      } else if leftElement > rightElement {
        orderedArray.append(rightElement)
        rightIndex += 1
      } else {
        orderedArray.append(leftElement)
        leftIndex += 1
        orderedArray.append(rightElement)
        rightIndex += 1
      }
    }

    while leftIndex < left.count {
      orderedArray.append(left[leftIndex])
      leftIndex += 1
    }

    while rightIndex < right.count {
      orderedArray.append(right[rightIndex])
      rightIndex += 1
    }
    
    return orderedArray
}


let answer = mergeSort(numbers);
print(answer)
