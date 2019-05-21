//
//  LicensedV8Tests.swift
//  Licensed
//
//  Created by Aaron Wright on 5/17/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import XCTest
@testable import Licensed

class LicenseV8Tests: XCTestCase {
    
    var version8 = """
        @

        ANSI 636026080102DL00410288ZA03290015DLDAQD12345678
        DCSPUBLIC
        DDEN
        DACJOHN
        DCUJR
        DDFN
        DADQUINCY
        DDGN
        DCAD
        DCIOMAHA
        DCBNONE
        DCDNONE
        DBNPUCKY
        DBGSTICKS
        DBSJ
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
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.version, License.Version.eight)
    }
    
    func testParseFirstName() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.firstName, "JOHN")
    }
    
    func testParseMiddleName() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.middleName, "QUINCY")
    }
    
    func testParseLastName() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.lastName, "PUBLIC")
    }
    
    func testParseSuffix() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.suffix, License.Suffix.junior)
    }
    
    func testParseExpirationDate() {
        let license = License.parse(string: self.version8)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "01312035")
        
        XCTAssertEqual(license.expirationDate, date)
    }
    
    func testParseIssueDate() {
        let license = License.parse(string: self.version8)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "08242015")
        
        XCTAssertEqual(license.issueDate, date)
    }
    
    func testParseDateOfBirth() {
        let license = License.parse(string: self.version8)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMddyyyy"
        
        let date = formatter.date(from: "01311970")
        
        XCTAssertEqual(license.dateOfBirth, date)
    }
    
    func testParseGender() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.eyeColor, License.EyeColor.green)
    }
    
    func testParseHairColor() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.hairColor, License.HairColor.brown)
    }
    
    func testParseHeight() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.height, 69)
    }
    
    func testParseStreet1() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.street1, "789 E OAK ST")
    }
    
    func testParseStreet2() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.street2, "APT 1")
    }
    
    func testParseCity() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.city, "ANYTOWN")
    }
    
    func testParseState() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.state, "CA")
    }
    
    func testParseZip() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.zip, "902230000")
    }
    
    func testParseCountry() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.country, License.Country.usa)
    }
    
    func testParseCustomerId() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.customerId, "D12345678")
    }
    
    func testParseDocumentId() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.documentId, "83D9BN217QO983B1")
    }
    
    func testParseFirstNameTruncation() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.firstNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParseMiddleNameTruncation() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.middleNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParseLastNameTruncation() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.lastNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParsePlaceOfBirth() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.placeOfBirth, "OMAHA")
    }
    
    func testParseAuditInformation() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.auditInformation, "AUDIT")
    }
    
    func testParseInventoryControlNumber() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.inventoryControlNumber, "12345678900000000000")
    }
    
    func testParseFirstNameAlias() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.firstNameAlias, "STICKS")
    }
    
    func testParseLastNameAlias() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.lastNameAlias, "PUCKY")
    }
    
    func testParseSuffixAlias() {
        let license = License.parse(string: self.version8)
        
        XCTAssertEqual(license.suffixAlias, "J")
    }
    
}
