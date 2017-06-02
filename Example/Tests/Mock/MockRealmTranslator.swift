//
//  MockRealmTranslator.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit
@testable import DAO_Swift

class MockRealmTranslator: NSObject, DAOTranslator {
    
    let entityNameString : String = "MockRealmEntity"
    let entryNameString : String = "MockRealmEntry"
    
    func entityName() -> String {
        return entityNameString
    }
    
    func entityClass() -> AnyClass {
        return MockRealmEntity.self
    }
    
    func entryName() -> String {
        return entryNameString
    }
    
    func entryClass() -> AnyClass {
        return MockRealmEntry.self
    }
    
    func toEntity(entry : DAOPersistent) -> DAOPersistent {
       
        let mockEntry : MockRealmEntry = entry as! MockRealmEntry
        
        let mockEntity = MockRealmEntity()
        mockEntity.ID = mockEntry.ID
        mockEntity.name = mockEntry.name
        
        return mockEntity
    }

    func toEntry(entity : DAOPersistent) -> DAOPersistent {
        
        let mockEntity : MockRealmEntity = entity as! MockRealmEntity
        
        let mockEntry = MockRealmEntry()
        mockEntry.ID = mockEntity.ID
        mockEntry.name = mockEntity.name
        
        return mockEntry
    }
}
