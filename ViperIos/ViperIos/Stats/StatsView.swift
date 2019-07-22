//
//  StatsView.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

class StatsView: UIViewController, StatsPresenterToView {

    var presenter: StatsViewToPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stats"
    }
}
