///Second smallest element in the array
let array = [2, -1, 3, 4, 8, 15, 0, -3, -5, -5]

var smallest = Int.max
var secondSmallest = Int.max

for item in array {
    if item == smallest {
        secondSmallest = item
    } else if item < smallest {
        secondSmallest = smallest
        smallest = item
    } else if item < secondSmallest {
        secondSmallest = item
    }
}

print(secondSmallest)

 smallest = Int.max
 secondSmallest = Int.max

for item in array {
    guard item != smallest, item != secondSmallest else {
        continue
    }
    if item < smallest {
        secondSmallest = smallest
        smallest = item
    } else if item < secondSmallest {
        secondSmallest = item
    }
}
print(secondSmallest)


///Second highest element in the array

 var highest = Int.min
 var secondHighest = Int.min

for item in array {
    guard item != highest, item != secondHighest else {
        continue
    }
    if item > highest {
        secondHighest = highest
        highest = item
    } else if item > secondHighest {
        secondHighest = item
    }
}
print(secondHighest)
