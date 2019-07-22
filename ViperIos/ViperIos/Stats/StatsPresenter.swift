//
//  StatsPresenter.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

class StatsPresenter: NSObject, StatsViewToPresenter, StatsInteractorToPresenter {
    var view: StatsPresenterToView!
    var router: StatsPresenterToRouter!
    var interactor: StatsPresenterToInteractor!

    func viewHasLoaded() {
        interactor.loadStats()
    }

    func statsUpdated(_ stats: (winsPlayer1: Int, winsPlayer2: Int, ties: Int)?) {
        if let stats = stats {
            view.updatePlayer1Wins(wins: String(stats.winsPlayer1))
            view.updatePlayer2Wins(wins: String(stats.winsPlayer2))
            view.updateTies(ties: String(stats.ties))
        } else {
            view.updatePlayer1Wins(wins: "You haven't played any games yet :(")
            view.updatePlayer2Wins(wins: "You haven't played any games yet :(")
            view.updateTies(ties: "You haven't played any games yet :(")
        }

    }

    func menu(navigationController: UINavigationController) {
        router.showMenu(navigationController: navigationController)
    }

    func error(title: String, description: String) {
        view.showError(title: title, description: description)
    }
}
