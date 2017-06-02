//
//  DAO.swift
//  DAO
//
//  Created by Nick Mur on 09.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit

protocol DAO {
 
    /// Init method.
    ///
    /// - Parameter translator: Translator.
    init(translator : DAOTranslator, name : String?)
    
    /// Persist entity to data base.
    ///
    /// - Parameter entity: Entity for save.
    /// - Returns: Operations result.
    func persist(entity : DAOPersistent) -> Bool
    
    /// Multi persist entity to data base.
    ///
    /// - Parameter entities: Array entities
    /// - Returns: Operation result.
    func persistAll(entities : [DAOPersistent]) -> Bool
    
    /// Read entity from data base.
    ///
    /// - Parameter ID: Entity id.
    /// - Returns: Entity.
    func read(ID : Int) -> DAOPersistent
    
    /// Multi read entity from data base.
    ///
    /// - Returns: Array entities.
    func readAll() -> [DAOPersistent]
    
    /// Read entities from sorters and filters.
    ///
    /// - Parameters:
    ///   - filters: Array filters.
    ///   - sorters: Array sorters.
    /// - Returns: Entities array.
    func readAll(filters:[NSPredicate], sorters:[NSSortDescriptor]) -> [DAOPersistent]
    
    /// Erase entity.
    ///
    /// - Parameter ID: Entity id.
    /// - Returns: Operation result.
    func erase(ID : Int) -> Bool
    
    /// Multi erase entities.
    ///
    /// - Returns: Operation result.
    func eraseAll() -> Bool
}
