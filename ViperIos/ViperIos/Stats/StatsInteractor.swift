//
//  StatsInteractor.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class StatsInteractor: NSObject, StatsPresenterToInteractor, StatsCoreDataToInteractor {
    var presenter: StatsInteractorToPresenter!
    var coreDataService: StatsInteractorToCoreData!

    func loadStats() {
        coreDataService.loadStats()
    }

    func statsUpdated(_ stats: (winsPlayer1: Int, winsPlayer2: Int, ties: Int)?) {
        presenter.statsUpdated(stats)
    }

    func error(title: String, description: String) {
        presenter.error(title: title, description: description)
    }
}
