//
//  TeamsInteractor.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit
import Alamofire

class TeamsInteractor : TeamsPToI{
    var presenter: TeamsIToP?

    //MARK:- get team data API
    func getTeamsData() {
        let request = AF.request("http://bit.ly/teams-heady")
        request.responseDecodable(of: TeamsModel.self) { (response) in
            guard let teamsData = response.value else { return }
            self.presenter?.loadTeamsData(data: teamsData.teams)
            self.getMatchData()
        }
    }
    
    //MARK:- get match data API
    func getMatchData(){
        let request = AF.request("http://bit.ly/matches-heady")
        request.responseDecodable(of: MatchesData.self) { (response) in
            guard let teamsData = response.value else { return }
            self.presenter?.loadMatchesData(data: teamsData.data)
        }
    }
}
