//
//  Welcome.swift
//  Avito Trainee
//
//  Created by packovv on 18.10.2022.
//

import Foundation

struct Welcome: Codable {
    let company: Company
}

struct Company: Codable {
    let name: String
    let employees: [Employee]
}

struct Employee: Codable {
    let name: String
    let phoneNumber: String
    let skills: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}

enum Link: String {
    case json = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
}

extension Employee: Comparable {
    static func < (lhs: Employee, rhs: Employee) -> Bool {
        lhs.name < rhs.name
    }
}
