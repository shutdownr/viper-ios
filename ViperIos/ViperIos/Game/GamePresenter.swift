//
//  GamePresenter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class GamePresenter: NSObject, ViewToPresenter, ModelToPresenter {
    var view: PresenterToView!
    var model: PresenterToModel!

    func tileSelected(position: TilePosition) {
        model.claimTile(position: position)
    }

    func reset() {
        model.reset()
    }

    func boardUpdated(board: [TileType]) {
        let players = model.getPlayers()
        let contents = board.map({ type -> String in
            switch type {
            case .None:
                return ""
            case .Player1:
                return String(players.player1.symbol)
            case .Player2:
                return String(players.player2.symbol)
            }
        })

        contents.enumerated().forEach({title in
            view.setButtonContent(button: TilePosition.fromInt(title.offset), text: title.element)
        })
    }

    func error(title: String, error: String) {
        view.showError(title: title, error: error)
    }

}
