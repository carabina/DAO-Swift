//
//  DAORealm.swift
//  DAO
//
//  Created by Nick Mur on 09.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit

//POD
import RealmSwift

public final class DAORealm: NSObject, DAO {
    
    let realmExtentionName = ".realm"
    
    var daoTranslator : DAOTranslator
    var realmName : String?
    var realmMemoryName : String?
    
    // MARK: - Custom init
    init(translator : DAOTranslator, realmMemoryID : String) {
        
        daoTranslator = translator
        realmMemoryName = realmMemoryID
    }
    
    // MARK: - DAO
    public init(translator : DAOTranslator, name : String?) {
        
        daoTranslator = translator
        realmName = name
    }

    public func persist(entity : DAOPersistent) -> Bool {
        
        let entry : Object =  daoTranslator.toEntry(entity: entity) as! Object
        
        return dbTransaction { (realm) in
            realm.add(entry, update: true)
        }
    }
    
    public func persistAll(entities : [DAOPersistent]) -> Bool {
        
        var entries : [Object] = []
        
        for entity : DAOPersistent in entities {
            entries.append(daoTranslator.toEntry(entity: entity) as! Object)
        }
        
        return dbTransaction(transactionBlock: { (realm) in
            realm.add(entries, update: true)
        })
    }
    
    public func read(ID : Int) -> DAOPersistent {
        
        let realmClass = daoTranslator.entryClass() as! Object.Type
        
        var entity : DAOPersistent!
        
        _ = dbTransaction { (realm) in
            let entry = realm.object(ofType: realmClass, forPrimaryKey: ID)
            entity = self.daoTranslator.toEntity(entry: entry as! DAOPersistent)
        }
        
        return entity!
    }
    
    public func readAll() -> [DAOPersistent] {
        
        let realmClass = daoTranslator.entryClass() as! Object.Type
        
        var entities : [DAOPersistent] = []
        
        _ = dbTransaction(transactionBlock: { (realm) in
            
            let result = realm.objects(realmClass)
            
            for entry in result {
                entities.append(daoTranslator.toEntity(entry: entry as! DAOPersistent))
            }
        })
        
        return entities
    }
    
    public func readAll(filters:[NSPredicate], sorters:[NSSortDescriptor]) -> [DAOPersistent] {
        
        let realmClass = daoTranslator.entryClass() as! Object.Type
        
        var entities : [DAOPersistent] = []
        
        _ = dbTransaction(transactionBlock: { (realm) in
            
            var result = realm.objects(realmClass)
            
            for predicate in filters {
                result = result.filter(predicate)
            }
            
            for sorter in sorters {
                result = result.sorted(byProperty: sorter.key!, ascending: sorter.ascending)
            }
            
            for entry in result {
                entities.append(daoTranslator.toEntity(entry: entry as! DAOPersistent))
            }
        })
        
        return entities
    }
    
    public func erase(ID : Int) -> Bool {
        
        return dbTransaction(transactionBlock: { (realm) in
            
            let realmClass = daoTranslator.entryClass() as! Object.Type
            let eraseEntry = realm.object(ofType: realmClass, forPrimaryKey: ID)
            
            realm.delete(eraseEntry!)
        })
    }
    
    public func eraseAll() -> Bool {
        
        return dbTransaction(transactionBlock: { (realm) in
            
            let realmClass = daoTranslator.entryClass() as! Object.Type
            let results = realm.objects(realmClass)
        
            realm.delete(results)
        })
    }
    
    // MARK : - Private
    
    private func realm(realmName : String?) -> Realm {
        
        if realmMemoryName != nil {
            return try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: realmMemoryName))
        }
        
        if realmName == nil {
            return try! Realm()
        }
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let realmUrl : URL = URL(string:documentsPath + "/" + realmName! + realmExtentionName)!
        
        let configurationRealm = Realm.Configuration(fileURL: realmUrl)
        
        return try! Realm(configuration: configurationRealm)
    }
    
    private func dbTransaction(transactionBlock : ((_ : Realm) -> Void)) -> Bool {
        
        let realm = self.realm(realmName: self.realmName)
        realm.beginWrite()
        transactionBlock(realm)
    
        do {
            try realm.commitWrite()
        }
        catch {
            realm.cancelWrite()
            return false
        }
        
        return true
    }
}
