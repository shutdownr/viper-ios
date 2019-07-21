//
//  GameRouter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

class GameRouter : NSObject, PresenterToRouter {
    static func createModule() -> GameView {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Game") as! GameView
        let presenter = GamePresenter()
        let interactor = GameInteractor()
        let router = GameRouter()
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        return view
    }

    func showMenu(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
