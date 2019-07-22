//
//  GamePresenter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

class GamePresenter: NSObject, GameViewToPresenter, GameInteractorToPresenter {
    var view: GamePresenterToView!
    var interactor: GamePresenterToInteractor!
    var router: GameRouter!

    func tileSelected(position: TilePosition) {
        interactor.claimTile(position: position)
    }

    func reset() {
        interactor.reset()
    }

    func menu(navigationController: UINavigationController) {
        router.showMenu(navigationController: navigationController)
    }

    func viewHasLoaded() {
        interactor.loadCoreData()
    }

    func stateUpdated(state: GameState) {
        view.setGameVisibility(visible: state.isGameVisible)
        view.setMenuVisibility(visible: state.isMenuVisible)
        view.setResultVisibility(visible: state.isResultVisible)
        view.setRestartVisibility(visible: state.isRestartVisible)
        view.setResultContent(content: state.resultContent)
    }

    func boardUpdated(board: [TileType]) {
        let players = interactor.getPlayers()
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
