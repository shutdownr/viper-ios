//
//  InteractorCoreDataProtocols.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

protocol InteractorToCoreData {
    func saveNewData(game: [TileType], isPlayer1Turn: Bool)
    func loadData() -> (game: [TileType], isPlayer1Turn: Bool)?
}

protocol CoreDataToInteractor {
    func error(title: String, error: String)
}
