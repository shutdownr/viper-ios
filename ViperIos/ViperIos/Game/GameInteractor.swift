//
//  GameInteractor.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class GameInteractor: NSObject, GamePresenterToInteractor, GameCoreDataToInteractor {
    private static var emptyGame: [TileType] = [.None, .None, .None, .None, .None, .None, .None, .None, .None]
    private var game: [TileType]
    private var isPlayer1Turn: Bool

    private var currentState: GameState!
    var presenter: GameInteractorToPresenter!
    var coreDataService: GameInteractorToCoreData!

    override init() {
        game = GameInteractor.emptyGame
        isPlayer1Turn = true
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

    func getPlayers() -> (player1: PlayerEntity, player2: PlayerEntity) {
        return (PlayerEntity.player1, PlayerEntity.player2)
    }

    private func hasWon(player: TileType) {
        let finishedState = FinishedState()
        coreDataService.gameWon(winner: player)
        if player == .None {
            finishedState.resultContent = "It's a tie!"
        } else {
            let winner = player == .Player1 ? PlayerEntity.player1 : PlayerEntity.player2
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
