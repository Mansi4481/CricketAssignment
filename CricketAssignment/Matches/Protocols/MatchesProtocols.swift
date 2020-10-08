//
//  MatchesProtocols.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

protocol MatchesVToP: class {
    var matchData: AllData? {get set}
}

protocol MatchesPToR: class {
    static func createModule(data:AllData) -> MatchesVC
}
