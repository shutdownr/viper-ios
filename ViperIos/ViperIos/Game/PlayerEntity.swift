//
//  PlayerEntity.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class PlayerEntity {
    public static var player1 = PlayerEntity(symbol: "🐍")
    public static var player2 = PlayerEntity(symbol: "🦅")
    var symbol: Character
    private init(symbol: Character) {
        self.symbol = symbol
    }
}
