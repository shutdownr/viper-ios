//
//  PresenterModelProtocols.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

protocol PresenterToModel {
    func claimTile(position: TilePosition)
    func getPlayers() -> (player1: GamePlayer, player2: GamePlayer)
    func reset()
}

protocol ModelToPresenter {
    func error(title: String, error: String)
    func boardUpdated(board: [TileType])
}
