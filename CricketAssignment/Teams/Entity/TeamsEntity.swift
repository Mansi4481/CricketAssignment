//
//  TeamsEntity.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

struct TeamsModel: Codable {
  let teams: [TeamsEntity]
  
  enum CodingKeys: String, CodingKey {
    case teams = "Teams"
  }
}

struct TeamsEntity:Codable{
    let id: Int
    let title: String
    let profilePic: String

    enum CodingKeys: String, CodingKey {
        case id
        case title = "name"
        case profilePic = "image"
      }
}


