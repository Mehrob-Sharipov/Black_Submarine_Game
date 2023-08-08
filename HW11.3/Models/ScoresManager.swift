//
//  ScoresManager.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 13.07.2023.
//

import Foundation

class ScoresManager {
    static let shared = ScoresManager()
    private init() {}
    
    private var scoresArray:[Scores]? = [.init(player: "Player", scores: 11, date: "22.02.23"),
                                         .init(player: "Player2", scores: 121, date: "22.02.22"),
                                         .init(player: "Player3", scores: 121, date: "22.02.20")]
    
    func addResult(score:Scores){
        scoresArray?.append(score)
        scoresArray = scoresArray?.sorted {$0.scores > $1.scores}
    }
    
    func result(byIndexPath indexPath:IndexPath) -> Scores {
        if let array = scoresArray?[indexPath.row] {
            return array
        }
        return Scores.init(player: "nil", scores: 1, date: "nil")
    }
        
    
    func scoresCount() -> Int {
        return scoresArray?.count ?? 0
    }
    
}


