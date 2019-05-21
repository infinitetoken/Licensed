//
//  LicenseTests.swift
//  Licensed
//
//  Created by Aaron Wright on 5/21/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import XCTest
@testable import Licensed

class LicenseTests: XCTestCase {

    var emptySample: String = ""
    var garbageSample: String = "13454576kh5lk135j5h1p35h1p3513i5uh1p35uh1p35oh13op5hu"
    
    func testEmptyData() {
        let license = License.parse(string: self.emptySample)
        
        XCTAssertNil(license.version)
    }
    
    func testMissingData() {
        let license = License.parse(string: self.garbageSample)
        
        XCTAssertNil(license.version)
    }
    
}
