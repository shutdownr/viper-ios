//
//  PresenterModelProtocols.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

protocol GamePresenterToInteractor {
    func claimTile(position: TilePosition)
    func getPlayers() -> (player1: PlayerEntity, player2: PlayerEntity)
    func reset()
    func loadCoreData()
}

protocol GameInteractorToPresenter {
    func error(title: String, error: String)
    func boardUpdated(board: [TileType])
    func stateUpdated(state: GameState)
}
