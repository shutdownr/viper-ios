//
//  GameModel.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class GameModel: NSObject, PresenterToModel {
    private static var emptyGame: [TileType] = [.None, .None, .None, .None, .None, .None, .None, .None, .None]
    private var game: [TileType]
    private var isPlayer1Turn: Bool

    private var player1: GamePlayer
    private var player2: GamePlayer

    var presenter: ModelToPresenter!

    init(presenter: ModelToPresenter) {
        self.presenter = presenter
        game = GameModel.emptyGame
        isPlayer1Turn = true
        player1 = GamePlayer(symbol: "🐍")
        player2 = GamePlayer(symbol: "🦅")
    }

    func getPlayers() -> (player1: GamePlayer, player2: GamePlayer) {
        print(player1.symbol)
        print(player2.symbol)
        return (player1: player1, player2: player2)
    }

    func claimTile(position: TilePosition) {
        if game[position.toInt()] != .None {
            presenter.error(title: "Already claimed", error: "Choose another tile")
            return
        }
        game[position.toInt()] = isPlayer1Turn ? .Player1 : .Player2
        isPlayer1Turn = !isPlayer1Turn
        presenter.boardUpdated(board: game)
    }

    func reset() {
        game = GameModel.emptyGame
        isPlayer1Turn = true
        presenter.boardUpdated(board: game)
    }
}

enum TileType {
    case None, Player1, Player2
}

enum TilePosition {
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

