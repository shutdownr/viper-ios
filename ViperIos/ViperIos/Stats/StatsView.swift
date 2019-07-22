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
    @IBOutlet weak var player1Wins: UILabel!
    @IBOutlet weak var player2Wins: UILabel!
    @IBOutlet weak var ties: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Stats"
        navigationItem.hidesBackButton = true
        presenter.viewHasLoaded()
    }

    func updatePlayer1Wins(wins: String) {
        player1Wins.text = wins
    }

    func updatePlayer2Wins(wins: String) {
        player2Wins.text = wins
    }

    func updateTies(ties: String) {
        self.ties.text = ties
    }

    func showError(title: String, description: String) {
        let alert = UIAlertController(title: title, message: description, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    @IBAction func menu(_ sender: Any) {
        if let nav = navigationController  {
            presenter.menu(navigationController: nav)
        }
    }
}
