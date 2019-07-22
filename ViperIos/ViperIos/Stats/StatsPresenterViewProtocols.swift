//
//  PresenterViewProtocols.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

protocol StatsPresenterToView {
    func updatePlayer1Wins(wins: String)
    func updatePlayer2Wins(wins: String)
    func updateTies(ties: String)
    func showError(title: String, description: String)
}

protocol StatsViewToPresenter {
    func viewHasLoaded()
    func menu(navigationController: UINavigationController)
}
