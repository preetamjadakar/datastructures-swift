import UIKit

class Player {
    let name: String
    var score: Int
    static var runRate = Float()
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
    func play() { }

    class func whoIam() -> String {
        return "\(runRate)"
    }
}

class Batsman: Player {
    
    override func play() {
        bat()
    }
    private func bat() {
        print("\(name) is batting 🏏")
    }
    override class func whoIam() -> String {
        return "Batsman with runrate \(runRate)"
    }
}
class Bowler: Player {
    override func play() {
        bowl()
    }
    private func bowl() {
        print("\(name) is bowling 🏏")
    }
    override class func whoIam() -> String {
           return "Bawler with runrate \(runRate)"
    }
}
class CricketTeam {
    let name: String
    let team: [Player]
    init(name: String, team: [Player]) {
        self.name = name
        self.team = team
    }
    func play() {
        team.forEach { $0.play() }
    }
}
//let rohitSharma = Batsman(name: "Rohit Sharma", score: 25)
//print(rohitSharma.score)
//rohitSharma.score = 30
//print(rohitSharma.score)
//
//print("runrate:", Player.runRate)
//Batsman.runRate = 3.1
//print("runrate:", Player.runRate)
//
//let bumrah = Batsman(name: "Jasprit Bumrah", score: 5)
//print(bumrah.score)
//let indianTeam = CricketTeam(name: "India", team: [rohitSharma, bumrah])
//indianTeam.play()
Batsman.runRate = 5.1

Batsman.whoIam()
print(Bowler.whoIam())
print(Batsman.whoIam())


class BBNClass {
    var temp = 30
    static var bbnValue = 5
    func makeSomeNoise() {
        BBNClass.bbnValue = 10
        temp = 2
    }
}

class BBNChild: BBNClass {
    override func makeSomeNoise() {
        super.makeSomeNoise()
    }
}

let bbn = BBNClass()
//bbn.makeSomeNoise()
print(BBNClass.bbnValue)

let bbn2 = BBNClass()
//bbn2.makeSomeNoise()
print(BBNClass.bbnValue)
print(bbn2.temp)

let child = BBNChild()
child.makeSomeNoise()
print(child.temp)
