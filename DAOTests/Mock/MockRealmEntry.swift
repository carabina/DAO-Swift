//
//  MockRealmEntry.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit
@testable import DAO
@testable import RealmSwift

class MockRealmEntry: Object, DAOPersistent {
    
    dynamic var ID : Int = 0
    dynamic var name : String?
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
