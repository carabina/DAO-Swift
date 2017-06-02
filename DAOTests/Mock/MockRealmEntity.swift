//
//  MockRealmObject.swift
//  DAO
//
//  Created by Nick Mur on 12.12.16.
//  Copyright © 2016 AlpinaDigital. All rights reserved.
//

import UIKit
@testable import DAO

class MockRealmEntity: NSObject, DAOPersistent {
    
    var ID : Int = 0
    var name : String?
}
