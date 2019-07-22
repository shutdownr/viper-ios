//
//  GameState.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import Foundation

class GameState {
    var isMenuVisible: Bool
    var isRestartVisible: Bool
    var isResultVisible: Bool
    var isGameVisible: Bool
    var resultContent: String
    init() {
        isMenuVisible = false
        isRestartVisible = false
        isResultVisible = false
        isGameVisible = false
        resultContent = ""
    }
}

class PlayingState: GameState {
    override init() {
        super.init()
        isGameVisible = true
    }
}

class FinishedState: GameState {
    override init() {
        super.init()
        isMenuVisible = true
        isRestartVisible = true
        isResultVisible = true
    }
}
