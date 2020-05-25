// Write two functions that finds the factorial of any number. One should use recursive, the other should just use a for loop

// TimeComplexity: O(n)
func findFactorialIterative(_ number: Int) -> Int {
    guard number > 0 else {
        fatalError("invalid input")
    }
    var answer = 1
    for i in 2...number {
        answer *= i
    }
    return answer;
}

print(findFactorialIterative(10))


// TimeComplexity: O(n)
func findFactorialRecursive(_ number: Int) -> Int{
    guard number > 0 else {
        fatalError("invalid input")
    }
    if number == 1 { return 1 }
    return number * findFactorialRecursive(number-1);
}

print(findFactorialRecursive(10))
