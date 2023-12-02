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
    private func getDiceColours(ofGame game: String) {
        
    }
    
    func getPossibleGames(from rawInput: String) -> Int {
        return 1
    }
}

