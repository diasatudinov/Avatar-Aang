//
//  Character.swift
//  Avatar Aang
//
//  Created by Atudinov Dias on 14.10.2023.
//

import Foundation


struct Character: Hashable, Codable {
    let photoURL: String?
    let name: String
    let affiliation: String?
    
    enum CodingKeys: String, CodingKey {
        case photoURL = "photoUrl"
        case name
        case affiliation = "affiliation"
    }
    
}


