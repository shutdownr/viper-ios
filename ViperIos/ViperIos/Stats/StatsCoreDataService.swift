//
//  StatsCoreDataService.swift
//  ViperIos
//
//  Created by Tim on 22.07.19.
//  Copyright © 2019 Tim. All rights reserved.
//

import UIKit
import CoreData

class StatsCoreDataService: NSObject, StatsInteractorToCoreData {
    var interactor: StatsCoreDataToInteractor!

    func loadStats() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { interactor.error(title: "Error", description: "Unable to access the AppDelegate"); return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSManagedObject>(entityName: "Stats")
        do {
            let stats = try managedContext.fetch(request)
            guard let actualStats = stats.first else { interactor.statsUpdated(nil); return }
            let winsPlayer1 = actualStats.value(forKey: "winsPlayer1") as! Int
            let winsPlayer2 = actualStats.value(forKey: "winsPlayer2") as! Int
            let ties = actualStats.value(forKey: "ties") as! Int
            interactor.statsUpdated((winsPlayer1, winsPlayer2, ties))
        } catch let error as NSError {
            interactor.error(title: "Loading Error", description: error.localizedDescription)
        }
    }
}
