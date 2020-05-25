//Implement a function that reverses a string using iteration...and then recursion!

func reverseString(_ string:String) -> String {
    let stringArray = Array(string)
    var reverseString:[Character] = []
    for i in stride(from: (stringArray.count - 1), through: 0, by: -1) {
        reverseString.append(stringArray[i])
    }
    return String(reverseString)
}

print(reverseString("My name is Khan!"))

func reverseString2(_ string:String) -> String {
    var reverse = ""
    for char  in string {
        reverse = char.description + reverse
    }
    return reverse
}

print(reverseString2("My name is Khan!"))


func reverseString3(_ string:String) -> String {
    return String(string.reversed())
}

print(reverseString3("My name is Khan!"))
