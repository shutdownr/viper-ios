//
//  StatsPresenterInteractorProtocols.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

protocol StatsPresenterToInteractor {
    func loadStats()
}

protocol StatsInteractorToPresenter {
    func statsUpdated(_ stats: (winsPlayer1: Int, winsPlayer2: Int, ties: Int)?)
    func error(title: String, description: String)
}
