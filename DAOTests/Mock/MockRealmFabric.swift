//
//  MockRealmFabric.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit

class MockRealmFabric: NSObject {
    
    static let mockNames : Array = ["Bill",
                             "Nick",
                             "Jack",
                             "Cristofer",
                             "Bread"]
    
    static func mockEntity(index : Int) -> MockRealmEntity {
        
        var mockIndex = index
        
        if mockIndex > mockNames.count {
            mockIndex =  mockNames.count
        }
        
        let mock = MockRealmEntity()
        mock.ID = mockIndex
        mock.name = mockNames[mockIndex]
        
        return mock
    }
    
    static func mockEntry(index : Int) -> MockRealmEntry {
        
        var mockIndex = index
        
        if mockIndex > mockNames.count {
            mockIndex =  mockNames.count
        }
        
        let mock =  MockRealmEntry()
        mock.ID = mockIndex
        mock.name = mockNames[mockIndex]
        
        return mock
    }
    
    static private func randomIndex() -> Int {
        return Int(arc4random_uniform(UInt32(mockNames.count)))
    }
}
