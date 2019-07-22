//
//  GameInteractor.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class GameInteractor: NSObject, PresenterToInteractor, CoreDataToInteractor {
    private static var emptyGame: [TileType] = [.None, .None, .None, .None, .None, .None, .None, .None, .None]
    private var game: [TileType]
    private var isPlayer1Turn: Bool

    private var player1: PlayerEntity
    private var player2: PlayerEntity

    private var currentState: GameState!
    var presenter: InteractorToPresenter!
    var coreDataService: InteractorToCoreData!

    override init() {
        game = GameInteractor.emptyGame
        isPlayer1Turn = true
        player1 = PlayerEntity(symbol: "🐍")
        player2 = PlayerEntity(symbol: "🦅")
    }

    func setNewState(_ state: GameState) {
        currentState = state
        presenter.stateUpdated(state: state)
    }

    func loadCoreData() {
        setNewState(PlayingState())
        if let newData = coreDataService.loadData() {
            game = newData.game
            isPlayer1Turn = newData.isPlayer1Turn
        }
        presenter.boardUpdated(board: game)
    }

    func getPlayers() -> (player1: PlayerEntity, player2: PlayerEntity) {
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
        if !checkWinConditions() {
            coreDataService.saveNewData(game: game, isPlayer1Turn: isPlayer1Turn)
        } else {
            coreDataService.saveNewData(game: GameInteractor.emptyGame, isPlayer1Turn: true)
        }
    }

    private func hasWon(player: TileType) {
        let finishedState = FinishedState()
        if player == .None {
            finishedState.resultContent = "It's a tie!"
        } else {
            let winner = player == .Player1 ? player1 : player2
            finishedState.resultContent = "Player \(winner.symbol) has won!"
        }
        setNewState(finishedState)
    }

    private func checkWinConditions() -> Bool{
        let patterns = [(0,1,2),(3,4,5),(6,7,8),(0,3,6),(1,4,7),(2,5,8),(0,4,8),(2,4,6)]
        for pattern in patterns {
            let result = check3Tiles(pattern)
            if result != .None {
                hasWon(player: result)
                return true
            }
        }
        if !game.contains(.None) {
            hasWon(player: .None)
            return true
        }
        return false
    }

    private func check3Tiles(_ values: (a: Int, b: Int, c: Int)) -> TileType{
        return game[values.a] == game[values.b] && game[values.b] == game[values.c] ? game[values.a] : .None
    }

    func reset() {
        game = GameInteractor.emptyGame
        isPlayer1Turn = true
        presenter.boardUpdated(board: game)
        setNewState(PlayingState())
        coreDataService.saveNewData(game: game, isPlayer1Turn: isPlayer1Turn)
    }

    func error(title: String, error: String) {
        presenter.error(title: title, error: error)
    }
}

enum TileType {
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

