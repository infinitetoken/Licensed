//
//  License.swift
//  Licensed
//
//  Created by Aaron Wright on 5/17/19.
//  Copyright © 2019 Infinite Token. All rights reserved.
//

import Foundation
import Regex

public struct License {
    
    public enum Suffix: String {
        case junior = "JR"
        case senior = "SR"
        case first = "I"
        case second = "II"
        case third = "III"
        case fourth = "IV"
        case fifth = "V"
        case sixth = "VI"
        case seventh = "VII"
        case eighth = "VIII"
        case nineth = "IX"
        
        static func from(string: String?) -> Suffix? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum Gender: String {
        case male = "1"
        case female = "2"
        
        static func from(string: String?) -> Gender? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum EyeColor: String {
        case black = "BLK"
        case blue = "BLU"
        case brown = "BRO"
        case gray = "GRY"
        case green = "GRN"
        case hazel = "HAZ"
        case maroon = "MAR"
        case pink = "PNK"
        case dichromatic = "DIC"
        
        static func from(string: String?) -> EyeColor? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum HairColor: String {
        case bald = "BAL"
        case black = "BLK"
        case blond = "BLN"
        case brown = "BRO"
        case gray = "GRY"
        case red = "RED"
        case sandy = "SDY"
        case white = "WHI"
        
        static func from(string: String?) -> HairColor? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum Country: String {
        case usa = "USA"
        case canada = "CAN"
        
        static func from(string: String?) -> Country? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum Truncation: String {
        case truncated = "T"
        case notTruncated = "N"
        
        static func from(string: String?) -> Truncation? {
            guard let string = string else { return nil }
            
            return self.init(rawValue: string)
        }
    }
    
    public enum Version: String {
        case one = "01"
        case two = "02"
        case three = "03"
        case four = "04"
        case five = "05"
        case six = "06"
        case seven = "07"
        case eight = "08"
    }
    
    public enum Key {
        case firstName
        case middleName
        case lastName
        case suffix
        case expirationDate
        case issueDate
        case dateOfBirth
        case gender
        case eyeColor
        case hairColor
        case height
        case street1
        case street2
        case city
        case state
        case postalCode
        case country
        case customerId
        case documentId
        case firstNameTruncation
        case middleNameTruncation
        case lastNameTruncation
        case placeOfBirth
        case auditInformation
        case inventoryControlNumber
        case firstNameAlias
        case lastNameAlias
        case suffixAlias
        case version
    }
    
    public let firstName: String?
    public let middleName: String?
    public let lastName: String?
    public let suffix: Suffix?
    public let expirationDate: Date?
    public let issueDate: Date?
    public let dateOfBirth: Date?
    public let gender: Gender?
    public let eyeColor: EyeColor?
    public let hairColor: HairColor?
    public let height: Double?
    public let street1: String?
    public let street2: String?
    public let city: String?
    public let state: String?
    public let postalCode: String?
    public let country: Country?
    public let customerId: String?
    public let documentId: String?
    public let firstNameTruncation: Truncation?
    public let middleNameTruncation: Truncation?
    public let lastNameTruncation: Truncation?
    public let placeOfBirth: String?
    public let auditInformation: String?
    public let inventoryControlNumber: String?
    public let firstNameAlias: String?
    public let lastNameAlias: String?
    public let suffixAlias: String?
    public let version: Version?
    
    // MARK: - Methods
    
    public static func parse(string: String) -> License {
        let version = self.parseVersion(string: string)
        
        return License(
            firstName: self.parseString(key: self.key(key: .firstName, for: version), string: string),
            middleName: self.parseString(key: self.key(key: .middleName, for: version), string: string),
            lastName: self.parseString(key: self.key(key: .lastName, for: version), string: string),
            suffix: Suffix.from(string: self.parseString(key: self.key(key: .suffix, for: version), string: string)),
            expirationDate: self.parseDate(key: self.key(key: .expirationDate, for: version), string: string),
            issueDate: self.parseDate(key: self.key(key: .issueDate, for: version), string: string),
            dateOfBirth: self.parseDate(key: self.key(key: .dateOfBirth, for: version), string: string),
            gender: Gender.from(string: self.parseString(key: self.key(key: .gender, for: version), string: string)),
            eyeColor: EyeColor.from(string: self.parseString(key: self.key(key: .eyeColor, for: version), string: string)),
            hairColor: HairColor.from(string: self.parseString(key: self.key(key: .hairColor, for: version), string: string)),
            height: self.parseDouble(key: self.key(key: .height, for: version), string: string),
            street1: self.parseString(key: self.key(key: .street1, for: version), string: string),
            street2: self.parseString(key: self.key(key: .street2, for: version), string: string),
            city: self.parseString(key: self.key(key: .city, for: version), string: string),
            state: self.parseString(key: self.key(key: .state, for: version), string: string),
            postalCode: self.parseString(key: self.key(key: .postalCode, for: version), string: string),
            country: Country.from(string: self.parseString(key: self.key(key: .country, for: version), string: string)),
            customerId: self.parseString(key: self.key(key: .customerId, for: version), string: string),
            documentId: self.parseString(key: self.key(key: .documentId, for: version), string: string),
            firstNameTruncation: Truncation.from(string: self.parseString(key: self.key(key: .firstNameTruncation, for: version), string: string)),
            middleNameTruncation: Truncation.from(string: self.parseString(key: self.key(key: .middleNameTruncation, for: version), string: string)),
            lastNameTruncation: Truncation.from(string: self.parseString(key: self.key(key: .lastNameTruncation, for: version), string: string)),
            placeOfBirth: self.parseString(key: self.key(key: .placeOfBirth, for: version), string: string),
            auditInformation: self.parseString(key: self.key(key: .auditInformation, for: version), string: string),
            inventoryControlNumber: self.parseString(key: self.key(key: .inventoryControlNumber, for: version), string: string),
            firstNameAlias: self.parseString(key: self.key(key: .firstNameAlias, for: version), string: string),
            lastNameAlias: self.parseString(key: self.key(key: .lastNameAlias, for: version), string: string),
            suffixAlias: self.parseString(key: self.key(key: .suffixAlias, for: version), string: string),
            version: version
        )
    }
    
    public static func parse(data: Data, encoding: String.Encoding = .utf8) -> License? {
        guard let string = String(data: data, encoding: encoding) else { return nil }
        
        return self.parse(string: string)
    }
    
    // MARK: - Helpers
    
    private static func parseVersion(string: String) -> Version? {
        guard let match = Regex("\\d{6}(\\d{2})").firstMatch(in: string) else { return nil }
        
        return Version(rawValue: match.captures.first!!)
    }
    
    private static func parseString(key: String?, string: String) -> String? {
        guard let key = key else { return nil }
        
        do {
            if let match = try Regex.init(string: "\(key)(.+)\\b").firstMatch(in: string) {
                return match.captures.first!
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    private static func parseDate(key: String?, string: String) -> Date? {
        guard let key = key else { return nil }
        
        do {
            if let match = try Regex.init(string: "\(key)(.+)\\b").firstMatch(in: string) {
                let formatter = DateFormatter()
                formatter.dateFormat = "MMddyyyy"
                
                return formatter.date(from: match.captures.first!!)
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    private static func parseDouble(key: String?, string: String) -> Double? {
        guard let key = key else { return nil }
        
        do {
            if let match = try Regex.init(string: "\(key)(\\d+)\\b").firstMatch(in: string) {
                return Double(match.captures.first!!)
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
    
    private static func key(key: Key, for version: Version?) -> String? {
        guard let version = version else { return nil }
        
        switch key {
        case .firstName:
            switch version {
            case .two, .three:
                return "DCT"
            case .one, .four, .five, .six, .seven, .eight:
                return "DAC"
            }
        case .middleName:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAD"
            }
        case .lastName:
            switch version {
            case .one:
                return "DAB"
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DCS"
            }
        case .suffix:
            switch version {
            case .one:
                return "DBN"
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DCU"
            }
        case .expirationDate:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DBA"
            }
        case .issueDate:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DBD"
            }
        case .dateOfBirth:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DBB"
            }
        case .gender:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DBC"
            }
        case .eyeColor:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAY"
            }
        case .hairColor:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAZ"
            }
        case .height:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAU"
            }
        case .street1:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAG"
            }
        case .street2:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAH"
            }
        case .city:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAI"
            }
        case .state:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAJ"
            }
        case .postalCode:
            switch version {
            case .one, .two, .three, .four, .five, .six, .seven, .eight:
                return "DAK"
            }
        case .country:
            switch version {
            case .one:
                return nil
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DCG"
            }
        case .customerId:
            switch version {
            case .one:
                return "DBJ"
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DAQ"
            }
        case .documentId:
            switch version {
            case .one:
                return nil
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DCF"
            }
        case .firstNameTruncation:
            switch version {
            case .one, .three:
                return nil
            case .two, .four, .five, .six, .seven, .eight:
                return "DDF"
            }
        case .middleNameTruncation:
            switch version {
            case .one, .three:
                return nil
            case .two, .four, .five, .six, .seven, .eight:
                return "DDG"
            }
        case .lastNameTruncation:
            switch version {
            case .one, .three:
                return nil
            case .two, .four, .five, .six, .seven, .eight:
                return "DDE"
            }
        case .placeOfBirth:
            switch version {
            case .one, .two:
                return nil
            case .three, .four, .five, .six, .seven, .eight:
                return "DCI"
            }
        case .auditInformation:
            switch version {
            case .one, .two:
                return nil
            case .three, .four, .five, .six, .seven, .eight:
                return "DCJ"
            }
        case .inventoryControlNumber:
            switch version {
            case .one, .two:
                return nil
            case .three, .four, .five, .six, .seven, .eight:
                return "DCK"
            }
        case .firstNameAlias:
            switch version {
            case .one:
                return "DBP"
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DBG"
            }
        case .lastNameAlias:
            switch version {
            case .one:
                return "DBO"
            case .two, .three, .four, .five, .six, .seven, .eight:
                return "DBN"
            }
        case .suffixAlias:
            switch version {
            case .one:
                return "DBR"
            case .two:
                return nil
            case .three, .four, .five, .six, .seven, .eight:
                return "DBS"
            }
        default:
            return nil
        }
    }
    
}
