var numbers = [99, 44, 6, 2, 1, 5, 63, 87, 283, 4, 0]

func quickSort(_ array:inout [Int], _ left:Int, _ right:Int) -> [Int]{
    var pivot = Int()
    var partitionIndex = Int()
    
    if(left < right) {
        pivot = right;
        partitionIndex = partition(&array, pivot, left, right);
        
        //sort left and right
        quickSort(&array, left, partitionIndex - 1);
        quickSort(&array, partitionIndex + 1, right);
    }
    return array
}

func partition(_ array:inout [Int], _ pivot:Int, _ left:Int, _ right:Int) -> Int {
    let pivotValue = array[pivot]
    var partitionIndex = left
    
    for i in left..<right {
        if(array[i] < pivotValue){
            swap(&array, i, partitionIndex);
            partitionIndex += 1
        }
    }
    swap(&array, right, partitionIndex);
    return partitionIndex;
}

func swap(_ array:inout [Int], _ firstIndex:Int, _ secondIndex:Int){
    let temp = array[firstIndex];
    array[firstIndex] = array[secondIndex];
    array[secondIndex] = temp;
}

//Select first and last index as 2nd and 3rd parameters
quickSort(&numbers, 0, numbers.count - 1)
print(numbers);
