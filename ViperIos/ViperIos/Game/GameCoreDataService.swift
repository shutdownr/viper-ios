//
//  GameCoreDataService.swift
//  ViperIos
//
//  Created by Tim on 21.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit
import CoreData

class GameCoreDataService: NSObject, GameInteractorToCoreData {
    var interactor : GameInteractor!

    func gameWon(winner: TileType) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { interactor.error(title: "Error", error: "Unable to access the AppDelegate"); return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Stats")

        do {
            let stats = try managedContext.fetch(request)
            let statsEntity = NSEntityDescription.entity(forEntityName: "Stats", in: managedContext)!
            let actualStats = stats.first ?? NSManagedObject(entity: statsEntity, insertInto: managedContext)
            switch winner {
            case .None:
                let wins = actualStats.value(forKey: "ties") as! Int
                actualStats.setValue(wins + 1, forKey: "ties")
                print("Total of \(wins+1) ties")
            case .Player1:
                let wins = actualStats.value(forKey: "winsPlayer1") as! Int
                actualStats.setValue(wins + 1, forKey: "winsPlayer1")
                print("Player1 has \(wins+1) wins")
            case .Player2:
                let wins = actualStats.value(forKey: "winsPlayer2") as! Int
                actualStats.setValue(wins + 1, forKey: "winsPlayer2")
                print("Player2 has \(wins+1) wins")
            }
            try managedContext.save()
        } catch let error as NSError {
            interactor.error(title: "Saving Error", error: error.localizedDescription)
        }
    }

    func saveNewData(game: [TileType], isPlayer1Turn: Bool) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { interactor.error(title: "Error", error: "Unable to access the AppDelegate"); return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Game")

        do {
            let games = try managedContext.fetch(request)
            let gameEntity = NSEntityDescription.entity(forEntityName: "Game", in: managedContext)!
            let actualGame = games.first ?? NSManagedObject(entity: gameEntity, insertInto: managedContext)

            actualGame.setValue(game[0].toString(), forKey: "topLeft")
            actualGame.setValue(game[1].toString(), forKey: "topMiddle")
            actualGame.setValue(game[2].toString(), forKey: "topRight")
            actualGame.setValue(game[3].toString(), forKey: "midLeft")
            actualGame.setValue(game[4].toString(), forKey: "midMiddle")
            actualGame.setValue(game[5].toString(), forKey: "midRight")
            actualGame.setValue(game[6].toString(), forKey: "botLeft")
            actualGame.setValue(game[7].toString(), forKey: "botMiddle")
            actualGame.setValue(game[8].toString(), forKey: "botRight")
            actualGame.setValue(isPlayer1Turn, forKey: "isPlayer1Turn")

            try managedContext.save()
        } catch let error as NSError {
            interactor.error(title: "Saving Error", error: error.localizedDescription)
        }
    }

    func loadData() -> (game: [TileType], isPlayer1Turn: Bool)?{
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { interactor.error(title: "Error", error: "Unable to access the AppDelegate"); return nil }
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Game")
        do {
            let games = try managedContext.fetch(request)
            print(games.count)
            guard let actualGame = games.first else { print("Got no game"); return nil }
            var gameArray: [TileType] = []
            gameArray.append(TileType.fromString(actualGame.value(forKey: "topLeft") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "topMiddle") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "topRight") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "midLeft") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "midMiddle") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "midRight") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "botLeft") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "botMiddle") as! String))
            gameArray.append(TileType.fromString(actualGame.value(forKey: "botRight") as! String))
            let isPlayer1Turn = actualGame.value(forKey: "isPlayer1Turn") as! Bool
            return (game: gameArray, isPlayer1Turn: isPlayer1Turn)
        } catch let error as NSError {
            interactor.error(title: "Loading Error", error: error.localizedDescription)
        }
        return nil
    }
}
