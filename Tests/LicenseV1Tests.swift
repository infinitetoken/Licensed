//
//  LicenseV1Tests.swift
//  Licensed
//
//  Created by Aaron Wright on 5/21/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import XCTest
@testable import Licensed

class LicenseV1Tests: XCTestCase {
    
    var sample: String = """
        @

        ANSI 636026010102DL00410288ZA03290015DLDBJD12345678
        DABPUBLIC
        DDEN
        DACJOHN
        DBNJR
        DDFN
        DADQUINCY
        DDGN
        DCAD
        DCIOMAHA
        DCBNONE
        DCDNONE
        DBOPUCKY
        DBPSTICKS
        DBRJ
        DBD08242015
        DBB01311970
        DBA01312035
        DBC1
        DCJAUDIT
        DAU069 in
        DAYGRN
        DAG789 E OAK ST
        DAHAPT 1
        DAIANYTOWN
        DAJCA
        DAK902230000
        DCF83D9BN217QO983B1
        DCGUSA
        DAW180
        DAZBRO
        DCK12345678900000000000
        DDB02142014
        DDK1
        ZAZAAN
        ZAB
        ZAC
    """
    
    func testParseVersion() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.version, License.Version.one)
    }
    
    func testParseFirstName() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.firstName, "JOHN")
    }
    
    func testParseMiddleName() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.middleName, "QUINCY")
    }
    
    func testParseLastName() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.lastName, "PUBLIC")
    }
    
    func testParseSuffix() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.suffix, License.Suffix.junior)
    }
    
    func testParseExpirationDate() {
        let license = License.parse(string: self.sample)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "01312035")
        
        XCTAssertEqual(license.expirationDate, date)
    }
    
    func testParseIssueDate() {
        let license = License.parse(string: self.sample)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "08242015")
        
        XCTAssertEqual(license.issueDate, date)
    }
    
    func testParseDateOfBirth() {
        let license = License.parse(string: self.sample)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "01311970")
        
        XCTAssertEqual(license.dateOfBirth, date)
    }
    
    func testParseGender() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.eyeColor, License.EyeColor.green)
    }
    
    func testParseHairColor() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.hairColor, License.HairColor.brown)
    }
    
    func testParseHeight() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.height, 69)
    }
    
    func testParseStreet1() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.street1, "789 E OAK ST")
    }
    
    func testParseStreet2() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.street2, "APT 1")
    }
    
    func testParseCity() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.city, "ANYTOWN")
    }
    
    func testParseState() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.state, "CA")
    }
    
    func testParseZip() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.postalCode, "902230000")
    }
    
    func testParseCountry() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.country)
    }
    
    func testParseCustomerId() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.customerId, "D12345678")
    }
    
    func testParseDocumentId() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.documentId)
    }
    
    func testParseFirstNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.firstNameTruncation)
    }
    
    func testParseMiddleNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.middleNameTruncation)
    }
    
    func testParseLastNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.lastNameTruncation)
    }
    
    func testParsePlaceOfBirth() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.placeOfBirth)
    }
    
    func testParseAuditInformation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.auditInformation)
    }
    
    func testParseInventoryControlNumber() {
        let license = License.parse(string: self.sample)
        
        XCTAssertNil(license.inventoryControlNumber)
    }
    
    func testParseFirstNameAlias() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.firstNameAlias, "STICKS")
    }
    
    func testParseLastNameAlias() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.lastNameAlias, "PUCKY")
    }
    
    func testParseSuffixAlias() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.suffixAlias, "J")
    }
    
}
