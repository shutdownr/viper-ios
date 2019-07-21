//
//  MenuView.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

class MenuView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func play(_ sender: Any) {
        guard let nav = navigationController else { return }
        MenuRouter.showGame(navigationController: nav)
    }

    @IBAction func stats(_ sender: Any) {
        guard let nav = navigationController else { return }
        MenuRouter.showStats(navigationController: nav)
    }
}
