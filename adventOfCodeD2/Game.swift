//
//  Game.swift
//  adventOfCodeD2
//
//  Created by Vito Borghi on 02/12/2023.
//

import Foundation

struct Roll{
    let redDieCount: Int
    let greenDieCount: Int
    let blueDieCount: Int
}

struct Game {
    let rollCount: Int
    
    let rolls: [Roll]
}


struct DiceMaster {
    
    private mutating func convert(from rawInput: String, to destination: inout [String], option: CharacterSet = .newlines) {
        destination = rawInput.components(separatedBy: option)
    }
    
    mutating func getPossibleGames(from rawInput: String) -> Int {
        let diceBag = (red: 12, green: 13, blue: 14)
        
        var validGames = 0
        
        var games: [String] = rawInput.components(separatedBy: .newlines)
        
        games.forEach{ game in
            
            var highRed = 0
            var highGreen = 0
            var highBlue = 0
            
            var gameID = -1
            
            let rolls = game.components(separatedBy: .punctuationCharacters)
            
            rolls.forEach { dice in
                if dice.contains("Game") {
                    gameID = Int(String(dice.filter{$0.isNumber}))!
                }
                else if dice.contains("red") {
                    let redDieCount = Int(String(dice.filter{$0.isNumber}))!
                    
                    if  redDieCount > highRed {
                        highRed = redDieCount
                    }
                }
               else if dice.contains("green") {
                    let greenDieCount = Int(String(dice.filter{$0.isNumber}))!
                    
                   if greenDieCount > highGreen {
                        highGreen = greenDieCount
                    }
                }
                else if dice.contains("blue") {
                    let blueDieCount = Int(String(dice.filter{$0.isNumber}))!
                    
                    if blueDieCount > highBlue {
                        highBlue = blueDieCount
                    }
                }
            }
            
            guard highRed <= diceBag.red else { return }
            guard highGreen <= diceBag.green else { return }
            guard highBlue <= diceBag.blue else { return }
            
            validGames += gameID
        }
        
        return validGames
    }
}

