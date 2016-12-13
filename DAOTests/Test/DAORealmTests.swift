//
//  DAOTests.swift
//  DAOTests
//
//  Created by Nick Mur on 09.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import XCTest
@testable import DAO
@testable import RealmSwift

class DAORealmTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testRealmPersist() {
        
        //given
        let memoryID = "realmPersist"
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        let mockEntity = MockRealmFabric.mockEntity(index: 0)
        
        //when
        let result : Bool = daoRealm.persist(entity: mockEntity)
        
        //then
        XCTAssert(result)
    }
    
    func testRealmPersistAll() {
        
        //given
        let memoryID = "realmPersistAll"
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        var index : Int = 0
        var mockEntities : [DAOPersistent] = []
        
        while index != 5 {
            mockEntities.append(MockRealmFabric.mockEntity(index: index))
            index = index + 1
        }
        
        //when
        let result : Bool = daoRealm.persistAll(entities: mockEntities)
        
        //then
        XCTAssert(result)
    }
    
    func testRealmRead() {
        
        //given
        let memoryID = "realmRead"
        let realm : Realm = MockRealmStack.realmInMemory(realmName: memoryID)
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        let mockEntity : MockRealmEntity = MockRealmFabric.mockEntity(index: 1)
        let mockEntry : MockRealmEntry = MockRealmTranslator().toEntry(entity: mockEntity) as! MockRealmEntry
        
        try! realm.write {
            realm.add(mockEntry, update: true)
        }
        
        //when
        let resultEntity : MockRealmEntity = daoRealm.read(ID: mockEntity.ID) as! MockRealmEntity
        
        //then
        XCTAssertEqual(mockEntity.ID, resultEntity.ID)
        XCTAssertEqual(mockEntity.name, resultEntity.name)
    }
    
    func testRealmReadAll() {
        
        //given
        let memoryID = "realmReadAll"
        let realm : Realm = MockRealmStack.realmInMemory(realmName: memoryID)
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        //when
        let entries : [MockRealmEntry] = [MockRealmFabric.mockEntry(index: 0),
                                          MockRealmFabric.mockEntry(index: 1),
                                          MockRealmFabric.mockEntry(index: 2)]
        try! realm.write {
            realm.add(entries, update: true)
        }
        
        var entities : [MockRealmEntity] = []
        let translator = MockRealmTranslator()
        
        for entry in entries {
            entities.append(translator.toEntity(entry: entry) as! MockRealmEntity)
        }
        
        let result = daoRealm.readAll() as! [MockRealmEntity]
        
        //then
        
        XCTAssertEqual(entities.first?.ID, result.first?.ID)
        XCTAssertEqual(entities.last?.name, result.last?.name)
    }
    
    func testRealmReadAllFiltersAndSorters() {
        
        //given
        let memoryID = "realmReadAllFiltersAndSorters"
        let realm : Realm = MockRealmStack.realmInMemory(realmName: memoryID)
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        
        
        //when
        
        
        
        //then
        
    }
    
    
    func testRealmErase() {
        
        //given
        let memoryID = "realmErase"
        let realm : Realm = MockRealmStack.realmInMemory(realmName: memoryID)
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        let mockEntity = MockRealmFabric.mockEntity(index: 0)
        let mockEntry = MockRealmTranslator().toEntry(entity: mockEntity) as! Object
        
        try! realm.write {
            realm.add(mockEntry, update: true)
            realm.add(MockRealmFabric.mockEntry(index: 1), update: true)
        }
        
        //when
        let result : Bool = daoRealm.erase(ID: mockEntity.ID)
        let entriesAfterErase : Results = realm.objects(MockRealmTranslator().entryClass() as! Object.Type)
        
        //then
        XCTAssert(result && entriesAfterErase.count == 1)
    }
    
    func testRealmEraseAll() {
        
        //given
        let memoryID = "realmEraseAll"
        let realm : Realm = MockRealmStack.realmInMemory(realmName: memoryID)
        let daoRealm = DAORealm(translator: MockRealmTranslator(), realmMemoryID: memoryID)
        
        try! realm.write {
            
            let entries : [MockRealmEntry] = [MockRealmFabric.mockEntry(index: 1),
                                              MockRealmFabric.mockEntry(index: 2),
                                              MockRealmFabric.mockEntry(index: 3)]
            
            realm.add(entries, update: true)
        }
        
        //when
        let result :Bool = daoRealm.eraseAll()
        let entriesAfterErase : Results = realm.objects(MockRealmTranslator().entryClass() as! Object.Type)
        
        //then
        XCTAssert(result && entriesAfterErase.count == 0)
    }
}
