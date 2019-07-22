//
//  GameRouter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

class GameRouter : NSObject, GamePresenterToRouter {
    static func createModule() -> GameView {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game") as! GameView
        let presenter = GamePresenter()
        let interactor = GameInteractor()
        let router = GameRouter()
        let coreDataService = GameCoreDataService()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.coreDataService = coreDataService
        coreDataService.interactor = interactor
        return view
    }

    func showMenu(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
