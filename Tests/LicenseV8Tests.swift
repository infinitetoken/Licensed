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
    
    var sample: String = """
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
    
    func testParseFromData() {
        guard let data = self.sample.data(using: .utf8) else { XCTFail(); return }
        guard let license = License.parse(data: data) else { XCTFail(); return }
        
        XCTAssertEqual(license.version, License.Version.eight)
    }
    
    func testParseVersion() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.version, License.Version.eight)
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
        
        XCTAssertEqual(license.country, License.Country.usa)
    }
    
    func testParseCustomerId() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.customerId, "D12345678")
    }
    
    func testParseDocumentId() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.documentId, "83D9BN217QO983B1")
    }
    
    func testParseFirstNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.firstNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParseMiddleNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.middleNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParseLastNameTruncation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.lastNameTruncation, License.Truncation.notTruncated)
    }
    
    func testParsePlaceOfBirth() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.placeOfBirth, "OMAHA")
    }
    
    func testParseAuditInformation() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.auditInformation, "AUDIT")
    }
    
    func testParseInventoryControlNumber() {
        let license = License.parse(string: self.sample)
        
        XCTAssertEqual(license.inventoryControlNumber, "12345678900000000000")
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
