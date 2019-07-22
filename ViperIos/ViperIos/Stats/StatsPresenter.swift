//
//  StatsPresenter.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class StatsPresenter: NSObject, StatsViewToPresenter, StatsInteractorToPresenter {
    var view: StatsPresenterToView!
    var router: StatsPresenterToRouter!
    var interactor: StatsPresenterToInteractor!
}
