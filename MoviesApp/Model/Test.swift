//
//  Test.swift
//  MoviesApp
//
//  Created by Furkan Saffet Olkay on 14.10.2021.
//

import Foundation
//
//  Member.swift
//  TestApp
//
//  Created by Enes Toprak on 14.10.2021.
//

import Foundation

// MARK: - Member
struct Member: Codable {
    let status: String
    let results: Int
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let active: Bool
    let membershipStatus, membershipType, id, name: String
    let memberUniqid, membershipPlan: String

    enum CodingKeys: String, CodingKey {
        case active, membershipStatus, membershipType
        case id
        case name, memberUniqid, membershipPlan
    }
}


