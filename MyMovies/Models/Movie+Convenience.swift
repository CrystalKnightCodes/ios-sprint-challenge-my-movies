//
//  Movie+Convenience.swift
//  MyMovies
//
//  Created by Christy Hicks on 12/16/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import Foundation
import CoreData

extension Movie {
    
    // MARK: - Properties
    var movieRepresentation: MovieRepresentation? {
        
        guard let title = title,
        let identifier = identifier else {return nil}
        let id = UUID(uuidString: identifier)
        return MovieRepresentation(title: title, identifier: id, hasWatched: hasWatched)
    }
    
    // MARK: - Initializers
    @discardableResult convenience init? (title: String, identifier: String = UUID().uuidString, hasWatched: Bool = false, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        
        self.hasWatched = hasWatched
        self.title = title
        self.identifier = identifier
    }
    
    @discardableResult convenience init?(_ representation: MovieRepresentation, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        let title = representation.title
        guard let hasWatched = representation.hasWatched,
            let identifier = representation.identifier?.uuidString else {return nil}
        
        self.init(title: title, identifier: identifier, hasWatched: hasWatched, context: context)
    }
}
