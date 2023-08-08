//
//  Model.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 17.06.2023.
//

import Foundation
import UIKit

enum ShipActions {
    case Up
    case Dawn
}

class NameDataBase {
    
    static let shared = NameDataBase()
    private init(){}
    
    enum imageNameAction {
        case next, back, random
    }
    
    private var indexS = 0
    private var countS = 0
    
    func submarineImageName(_ imageNameAction:imageNameAction) -> String {
        let submarineNameArray = ["s1","s2","s3","s4","s1f","s2f"]
        switch imageNameAction {
        case .next:
            if countS == 0 {
                countS += 1
                return submarineNameArray[0]
            } else if indexS != submarineNameArray.count - 1 {
                indexS += 1
            }
        case .back:
            if indexS != 0 {
                indexS -= 1
            }
        case .random:
            indexS = Int.random(in: 0...(submarineNameArray.count - 1))
        }
        return submarineNameArray[indexS]
    }
    
    
    private var indexH = 0
    private var countH = 0
    
    func hindranceImageName(_ imageNameAction:imageNameAction) -> String {
        let hindranceNameArray = ["h1","h2","h3","h1s","h2s"]
        switch imageNameAction {
        case .next:
            if countH == 0 {
                countH += 1
                return hindranceNameArray[0]
            } else if indexH != hindranceNameArray.count - 1 {
                indexH += 1
            }
        case .back:
            if indexH != 0 {
                indexH -= 1
            }
        case .random:
            indexH = Int.random(in: 0...(hindranceNameArray.count - 1))
        }
        return hindranceNameArray[indexH]
    }
}
