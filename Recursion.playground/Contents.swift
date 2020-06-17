

/// recursion only simplifies the algorithm, no other benefits
/// Sometimes time and space complexity is worst than normal functions
func factorial(_ number: Int) -> Int {
    //base case
    if number == 0 {
        return 1
    }
    
    //recursion case
    return number * factorial(number - 1)
}

print(factorial(5))
print(factorial(6))


func power(of number:Int, by:Int) -> Int {
    //base case
    if by == 1 {
        return number
    }
    
    //recursive case
    return number * power(of: number, by: by - 1)
}

print(power(of: 2, by: 1))
print(power(of: 5, by: 5))
