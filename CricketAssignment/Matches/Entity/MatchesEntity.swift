//
//  MatchesModel.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit
struct MatchesData: Codable{
    let data : [MatchesModel]
    
    enum CodingKeys: String, CodingKey{
        case data = "Matches"
    }
}
struct MatchesModel: Codable {
    let id: Int
    let teams : [MatchesEntity]
    enum CodingKeys: String, CodingKey {
        case id
        case teams = "Teams"
    }
}

struct MatchesEntity: Codable{
    let id : Int
    let score : Double
}
