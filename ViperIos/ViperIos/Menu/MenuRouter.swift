//
//  MenuRouter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

class MenuRouter : NSObject {
    static func createModule() -> MenuView {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Menu") as! MenuView
        return view
    }

    static func showGame(navigationController: UINavigationController) {
        navigationController.pushViewController(GameRouter.createModule(), animated: true)
    }

    static func showStats(navigationController: UINavigationController) {
        navigationController.pushViewController(StatsRouter.createModule(), animated: true)
    }
}
