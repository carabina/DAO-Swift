//
//  MockRealmStack.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit
@testable import RealmSwift

class MockRealmStack: NSObject {
    
    static func realmInMemory(realmName: String) -> Realm {
        let configuration = Realm.Configuration(inMemoryIdentifier: realmName)
        return try! Realm(configuration: configuration)
    }
}
