//
//  ScoresModel.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 13.07.2023.
//

import Foundation

class Scores {
    let player: String
    let scores: Int
    let date: String
    
    init(player: String, scores: Int, date: String) {
        self.player = player
        self.scores = scores
        self.date = date
    }
}
