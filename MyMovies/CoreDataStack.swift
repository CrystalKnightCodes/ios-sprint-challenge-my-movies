//
//  CoreDataStack.swift
//  MyMovies
//
//  Created by Christy Hicks on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

class CoreDataStack {
    // MARK: - Properties
    static let shared = CoreDataStack()
    
    private init() {
        
    }
    
    lazy var container: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Movies")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error {
                fatalError("Core sata was unable to load persistence stores: \(error)")
            }
        })
        
        return container
    }()
    
    var mainContext: NSManagedObjectContext {
        return container.viewContext
    }
    
    var backgroundContext: NSManagedObjectContext {
        return container.newBackgroundContext()
    }
    
    // MARK: - Methods
    func save(context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        context.performAndWait {
            do {
                try context.save()
            } catch {
                NSLog("error saving context: \(error)")
                context.reset()
            }
        }
    }
}
