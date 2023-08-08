//
//  SettingsMOdel.swift
//  HW11.3
//
//  Created by Sharipov Mehrob on 26.06.2023.
//

import Foundation
import UIKit


class SettingsModel: Codable {
    static let shared = SettingsModel()
    private init() {}
    
    var player: String = "Player"
    var submarineName = "s2"
    var hindranceName = "h3"
    var hardLavel:Float = 1.0
    var randomHindrance = true
    
    
    
    public enum CodingKeys: String, CodingKey {
        case player, submarineName, hindranceName, hardLavel, randomHindrance
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.player = try container.decode(String.self, forKey: .player)
        self.submarineName = try container.decode(String.self, forKey: .submarineName)
        self.hindranceName = try container.decode(String.self, forKey: .hindranceName)
        self.hardLavel = try container.decode(Float.self, forKey: .hardLavel)
        self.randomHindrance = try container.decode(Bool.self, forKey: .randomHindrance)
    }
    
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(self.player, forKey: .player)
        try container.encode(self.submarineName, forKey: .submarineName)
        try container.encode(self.hindranceName, forKey: .hindranceName)
        try container.encode(self.hardLavel, forKey: .hardLavel)
        try container.encode (self.randomHindrance, forKey: .randomHindrance)
    }
    
    
    
}


