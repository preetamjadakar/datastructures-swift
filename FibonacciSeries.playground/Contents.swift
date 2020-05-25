// Given a number N return the index value of the Fibonacci sequence, where the sequence is:

// 0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144 ...
// the pattern of the sequence is that each value is the sum of the 2 previous values, that means that for N=5 → 2+3

//For example: fibonacciRecursive(6) should return 8

// TimeComplexity: O(n)
// SpaceComplexity: O(n)
func fibonacciIterative(_ number: Int) -> Int {
    guard number > -1 else {
        fatalError("invalid input")
    }
    if number < 2 { return number }
    var series = [0,1]
    for i in 2...number {
        series.append(series[i-1] + series[i-2])
    }
    return series[number]
}

fibonacciIterative(21);

// TimeComplexity: O(2^n)
// SpaceComplexity: O(1)
func fibonacciRecursive(_ number: Int) -> Int {
    guard number > -1 else {
        fatalError("invalid input")
    }
    if number < 2 { return number }
    return fibonacciRecursive(number - 1) + fibonacciRecursive(number - 2)
}

fibonacciRecursive(21);
