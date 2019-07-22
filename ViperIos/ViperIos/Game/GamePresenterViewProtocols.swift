//
//  PresenterViewProtocols.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation
import UIKit

protocol GamePresenterToView {
    func setButtonContent(button: TilePosition, text: String)
    func showError(title: String, error: String)
    func setResultVisibility(visible: Bool)
    func setResultContent(content: String)
    func setRestartVisibility(visible: Bool)
    func setMenuVisibility(visible: Bool)
    func setGameVisibility(visible: Bool)
}

protocol GameViewToPresenter {
    func tileSelected(position: TilePosition)
    func reset()
    func menu(navigationController: UINavigationController)
    func viewHasLoaded()
}
