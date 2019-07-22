//
//  ViewController.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit

class GameView: UIViewController, PresenterToView {
    @IBOutlet weak var topLeft: UIButton!
    @IBOutlet weak var topMiddle: UIButton!
    @IBOutlet weak var topRight: UIButton!
    @IBOutlet weak var midLeft: UIButton!
    @IBOutlet weak var midMiddle: UIButton!
    @IBOutlet weak var midRight: UIButton!
    @IBOutlet weak var botLeft: UIButton!
    @IBOutlet weak var botMiddle: UIButton!
    @IBOutlet weak var botRight: UIButton!
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var restart: UIButton!
    @IBOutlet weak var menu: UIButton!
    @IBOutlet weak var grid: UIImageView!

    var presenter: ViewToPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        navigationItem.title = "Game"
        presenter.viewHasLoaded()
    }

    func showError(title: String, error: String) {
        let alert = UIAlertController(title: title, message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }

    func setButtonContent(button: TilePosition, text: String) {
        switch button {
            case .TopLeft:
                topLeft.setTitle(text, for: .normal)
            case .TopMiddle:
                topMiddle.setTitle(text, for: .normal)
            case .TopRight:
                topRight.setTitle(text, for: .normal)
            case .MidLeft:
                midLeft.setTitle(text, for: .normal)
            case .MidMiddle:
                midMiddle.setTitle(text, for: .normal)
            case .MidRight:
                midRight.setTitle(text, for: .normal)
            case .BotLeft:
                botLeft.setTitle(text, for: .normal)
            case .BotMiddle:
                botMiddle.setTitle(text, for: .normal)
            case .BotRight:
                botRight.setTitle(text, for: .normal)
        }
    }

    func setResultVisibility(visible: Bool) {
        result.isHidden = !visible
    }

    func setRestartVisibility(visible: Bool) {
        restart.isHidden = !visible
    }

    func setMenuVisibility(visible: Bool) {
        menu.isHidden = !visible
    }

    func setGameVisibility(visible: Bool) {
        grid.isHidden = !visible
        topLeft.isHidden = !visible
        topMiddle.isHidden = !visible
        topRight.isHidden = !visible
        midLeft.isHidden = !visible
        midMiddle.isHidden = !visible
        midRight.isHidden = !visible
        botLeft.isHidden = !visible
        botMiddle.isHidden = !visible
        botRight.isHidden = !visible
    }

    func setResultContent(content: String) {
        result.text = content
    }

    @IBAction func topLeft(_ sender: Any) {
        presenter.tileSelected(position: .TopLeft)
    }
    @IBAction func topMiddle(_ sender: Any) {
        presenter.tileSelected(position: .TopMiddle)
    }
    @IBAction func topRight(_ sender: Any) {
        presenter.tileSelected(position: .TopRight)
    }

    @IBAction func midLeft(_ sender: Any) {
        presenter.tileSelected(position: .MidLeft)
    }
    @IBAction func midMiddle(_ sender: Any) {
        presenter.tileSelected(position: .MidMiddle)
    }
    @IBAction func midRight(_ sender: Any) {
        presenter.tileSelected(position: .MidRight)
    }

    @IBAction func botLeft(_ sender: Any) {
        presenter.tileSelected(position: .BotLeft)
    }
    @IBAction func botMiddle(_ sender: Any) {
        presenter.tileSelected(position: .BotMiddle)
    }
    @IBAction func botRight(_ sender: Any) {
        presenter.tileSelected(position: .BotRight)
    }

    @IBAction func menu(_ sender: Any) {
        guard let nav = navigationController else { return }
        presenter.menu(navigationController: nav)
    }
    @IBAction func restart(_ sender: Any) {
        presenter.reset()
    }

}
