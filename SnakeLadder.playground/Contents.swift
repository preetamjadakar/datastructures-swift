import Foundation

// Snakes and Ladders Game

let finalSquare = 25 // 25 squares in the game (0 to 24)

var board = Array(repeatElement(0, count: finalSquare + 1))

// in 4 squares as ladders (+ values) and 4 squares as snakes (- values)
// ladders move the player forward by value in square
// snakes move the player backward by value in square
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02; board[15] = +05
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08

var currentSquare = 0   // player position
var diceRoll = 0 // moves are determined by an 8-sided die

func randNum(limit: Int) -> Int {
  return Int(arc4random_uniform(UInt32(limit)))
}

// start the game
print("Game Starting at square \(currentSquare)")

var gameOver = false

while currentSquare != finalSquare {
    diceRoll = randNum(limit: 7)
  switch currentSquare + diceRoll {
  case finalSquare:
    // diceRolled moved player to finalSquare
    // game over
    print("starting \(currentSquare), ")
    print("diceRoll \(diceRoll), ")
    print("destination \(currentSquare + diceRoll), Game Over, You Won!")
    print()
    gameOver = true
    break
  case let newSquare where newSquare > finalSquare:
    // diceRoll moved player beyound finalSquare
    // roll again
    print("starting \(currentSquare), ")
    print("diceRoll \(diceRoll), ")
    print("destination \(currentSquare + diceRoll), Re-roll")
    print()
    continue
  default:
    // valid move
    // update board
    print("starting \(currentSquare), ")
    print("diceRoll \(diceRoll), ")
    currentSquare += diceRoll
    print("destination \(currentSquare), ")
    print("instruction \(board[currentSquare]), ")
    currentSquare += board[currentSquare]
    print("result \(currentSquare)")
    print()
  }
  if gameOver {
    break
  }
}


