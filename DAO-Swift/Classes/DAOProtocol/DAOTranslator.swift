//
//  DAOTranslator.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit

public protocol DAOTranslator {
    
    /// Request entity class name.
    ///
    /// - Returns: Entity class name.
    func entityName() -> String
    
    /// Request entity class.
    ///
    /// - Returns: Entity class.
    func entityClass() -> AnyClass
    
    /// Request entry name.
    ///
    /// - Returns: Entry name.
    func entryName() -> String

    /// Request entry class name.
    ///
    /// - Returns: Entry class.
    func entryClass() -> AnyClass
    
    /// Convert entry objetct to entity.
    ///
    /// - Returns: Entity object.
    func toEntity(entry : DAOPersistent) -> DAOPersistent
    
    /// Convert entity ibject to entry.
    ///
    /// - Returns: Entry object.
    func toEntry(entity : DAOPersistent) -> DAOPersistent
}
