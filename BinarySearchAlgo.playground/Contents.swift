extension Array where Iterator.Element == Int {
    func isContainsUsingBinarySearch(_ value:Int) -> Bool {
        
        var lowerBound = 0//5
        var upperBound = self.count - 1//10
        var middle = 0
        var found = false

        while lowerBound <= upperBound {
            if value < self[lowerBound] || value > self[upperBound] {
                print("number is out of search range")
                break
            }
            middle = (lowerBound + upperBound)/2//(5+10)/2=7, (5+7)/2=6
            print("middle:", middle)
            print("numbers[middle]:", self[middle])//38,47
            if self[middle] == value {
                found = true
                break
            } else if self[middle] > value {// 47>46
                upperBound = middle - 1 //7
            } else if self[middle] < value { //38<46
                lowerBound = middle + 1//6
            }
            
        }
        return found
    }
}
let numbers = [1,5,6,9,23,38,46,47,89,90,100]
print(numbers.isContainsUsingBinarySearch(939))
