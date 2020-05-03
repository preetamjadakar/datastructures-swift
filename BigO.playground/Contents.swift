//Linear Time complexity
//Mark:- O(n) example
let fish = ["dory", "bruce", "marlin", "nemo"];
let nemo = ["nemo"];
let everyone = ["dory", "bruce", "marlin", "nemo", "gill", "bloat", "nigel", "squirt", "darla", "hank"];

let large = Array.init(repeating: "nemo", count: 100000)

func findNemo(_ fish:[String]) {
  for i in 0..<fish.count {
    if (fish[i] == "nemo") {
      print("Found NEMO!");
    }
  }

// modern-style for loop
  /*
     fish.forEach { fishName in
       if (fishName == "nemo") {
         print("Found NEMO!");
       }
     }
 */
}

findNemo(everyone)


//Constant Time complexity
//Mark:- O(1) example

let boxes = [1, 3, 2, 5, 5]

func processFirst(_ data: [Int]) {
    guard let first = boxes.first else {
        return
    }
    print(first)
}

processFirst(boxes)

//Quadratic Time complexity
//Mark:- O(n^2) example

func printAllPaires(_ data: [Int]) {
    data.forEach { number1 in
        data.forEach { (number2) in
            print("[\(number1), \(number2)]")
        }
    }
}

printAllPaires(boxes)



//Logarithmic Time complexity
//Mark:- O(log n) example

var j = 1
let n = 10000
while j < n {
  // do constant time stuff
  j *= 2
}
//Binary Search is the best example



//Factorial Time complexity
//Mark:- O(n!) example
func nFactFunc(n: Int) {
  for _ in stride(from: 0, to: n, by: 1) {
    nFactFunc(n: n - 1)
  }
}

//References:
//https://www.bigocheatsheet.com/
//https://stackoverflow.com/questions/487258/what-is-a-plain-english-explanation-of-big-o-notation
