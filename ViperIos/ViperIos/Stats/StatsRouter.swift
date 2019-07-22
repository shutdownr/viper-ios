//
//  StatsRouter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

class StatsRouter: NSObject, StatsPresenterToRouter {
    static func createModule() -> StatsView {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Stats") as! StatsView
        let presenter = StatsPresenter()
        let router = StatsRouter()
        let interactor = StatsInteractor()
        let coreDataService = StatsCoreDataService()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.coreDataService = coreDataService
        coreDataService.interactor = interactor
        return view
    }

    func showMenu(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
