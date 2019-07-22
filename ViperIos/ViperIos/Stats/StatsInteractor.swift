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
}
