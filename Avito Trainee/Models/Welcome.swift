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
