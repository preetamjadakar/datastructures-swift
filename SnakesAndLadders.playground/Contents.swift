import UIKit

var str = "Hello, playground"

let finalSquare = 25
var board = Array.init(repeating: 0, count: 25)

//ladder
board[3] = +5; board[9] = +8;
board[19] = +5; board[12] = +5;

//snakes
board[5] = -4; board[8] = -4;
board[11] = -5; board[22] = -9;

var currentPosition:Int = 0
while currentPosition != finalSquare {
    let diceValue = Int(arc4random_uniform(7)) + 1
    switch currentPosition + diceValue {
    case finalSquare:
        currentPosition += diceValue
        print("got \(diceValue), so reached at \(currentPosition)")
        print("GAME OVER!")
        break
    case let value where value > finalSquare: //invalid move
        print("got \(diceValue), so reaching at \(value) re-run")
        continue
    default:
        currentPosition += diceValue
        currentPosition += board[currentPosition]
        print("got \(diceValue), so reached at \(currentPosition)")
        continue
    }
}

