//
//  StatsRouter.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

class StatsRouter : NSObject {
    static func createModule() -> StatsView {
        let view = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "Stats") as! StatsView
        return view
    }

    func showMenu(navigationController: UINavigationController) {
        navigationController.popViewController(animated: true)
    }
}
