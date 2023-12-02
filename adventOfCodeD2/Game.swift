//
//  Game.swift
//  adventOfCodeD2
//
//  Created by Vito Borghi on 02/12/2023.
//

import Foundation

struct DiceMaster {

    mutating func getPossibleGames(from rawInput: String, forPart part: Int) -> Int {
        let diceBag = (red: 12, green: 13, blue: 14)
        
        var validGames = 0
        var sumOfPowers = 0
        
        var games: [String] = rawInput.components(separatedBy: .newlines)
        
        games.forEach{ game in
            
            var highRed = 1
            var highGreen = 1
            var highBlue = 1
            
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
            
            sumOfPowers += highRed * highGreen * highBlue
            
            guard highRed <= diceBag.red else { return }
            guard highGreen <= diceBag.green else { return }
            guard highBlue <= diceBag.blue else { return }
            
            validGames += gameID
        }
        
        return part == 1 ? validGames : sumOfPowers
    }
}

