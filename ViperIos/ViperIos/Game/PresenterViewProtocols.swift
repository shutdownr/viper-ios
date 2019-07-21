//
//  PresenterViewProtocols.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

protocol PresenterToView {
    func setButtonContent(button: TilePosition, text: String)
    func showError(title: String, error: String)
}

protocol ViewToPresenter {
    func tileSelected(position: TilePosition)
    func reset()
    func menu(navigationController: UINavigationController)
}
