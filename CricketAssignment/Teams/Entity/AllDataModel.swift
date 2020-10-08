//
//  AllDataModel.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 08/10/20.
//

import UIKit


class AllData : NSObject{
    var id = 0
    var name = ""
    var subTitle = ""
    var img = ""
    var wonScore = 0
    var loseScore = 0
    var drawScore = 0
    var totalPoint = 0
    var totalMatchPlayed = 0
    var newMatches = [MatchesDetailModel]()
    
    static func loadAllData(teams : [TeamsEntity], matches: [MatchesModel]) -> [AllData]{
        var allData = [AllData]()
        for team in teams{
            let data = AllData()
            data.id = team.id
            data.name = team.title
            data.img = team.profilePic
            //check for each match from the list
            for match in matches{
                let isMatchPlayed = match.teams.filter({$0.id == team.id}).count > 0
                //if team played match
                if isMatchPlayed{
                    data.totalMatchPlayed += 1
                    
                    var matchData = MatchesDetailModel()
                    //get score details
                    let findScore = match.teams[0].score - match.teams[1].score
                    if (findScore > 0 && match.teams[0].id == team.id) || (findScore < 0 && match.teams[1].id == team.id){
                        data.wonScore += 1
                        matchData.isWinner = true
                    }else if findScore == 0{
                        data.drawScore += 1
                        matchData.isDraw = true
                    }else{
                        data.loseScore += 1
                        matchData.isLoser = true
                    }
                    //get teams played vs each other
                    let team1Data = teams.filter({$0.id == match.teams[0].id})
                    let team2Data = teams.filter({$0.id == match.teams[1].id})
                    if team1Data.count > 0 && team2Data.count > 0{
                        matchData.title = "\(team1Data[0].title) vs \(team2Data[0].title)"
                    }
                    //save new match model data
                    data.newMatches.append(matchData)
                }
            }
            //total points
            data.totalPoint = data.wonScore * 2 + data.drawScore
            data.subTitle = "M: \(data.totalMatchPlayed) W: \(data.wonScore) L: \(data.loseScore) D: \(data.drawScore) P: \(data.totalPoint)"
            allData.append(data)
        }
        return allData
    }
}

struct MatchesDetailModel{
    var title = ""
    var isWinner = false
    var isLoser = false
    var isDraw = false
}
