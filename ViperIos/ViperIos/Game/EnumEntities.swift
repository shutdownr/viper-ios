//
//  EnumEntities.swift
//  ViperIos
//
//  Created by Tim on 23.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

public enum TileType {
    case None, Player1, Player2
    func toString() -> String {
        switch self {
        case .None:
            return "None"
        case .Player1:
            return "Player1"
        case .Player2:
            return "Player2"
        }
    }

    static func fromString(_ string: String) -> TileType {
        switch string {
        case "None":
            return .None
        case "Player1":
            return .Player1
        case "Player2":
            return .Player2
        default:
            return .None
        }
    }
}

public enum TilePosition {
    case TopLeft, TopMiddle, TopRight, MidLeft, MidMiddle, MidRight, BotLeft, BotMiddle, BotRight
    func toInt() -> Int {
        switch self {
        case .TopLeft:
            return 0
        case .TopMiddle:
            return 1
        case .TopRight:
            return 2
        case .MidLeft:
            return 3
        case .MidMiddle:
            return 4
        case .MidRight:
            return 5
        case .BotLeft:
            return 6
        case .BotMiddle:
            return 7
        case .BotRight:
            return 8
        }
    }
    static func fromInt(_ int: Int) -> TilePosition {
        switch int {
        case 0:
            return .TopLeft
        case 1:
            return .TopMiddle
        case 2:
            return .TopRight
        case 3:
            return .MidLeft
        case 4:
            return .MidMiddle
        case 5:
            return .MidRight
        case 6:
            return .BotLeft
        case 7:
            return .BotMiddle
        case 8:
            return .BotRight
        default:
            return .TopLeft
        }
    }
}

