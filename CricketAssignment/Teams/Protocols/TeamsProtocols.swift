//
//  TeamsProtocols.swift
//  OnBlickESS
//
//  Created by Bhavna on 03/04/19.
//  Copyright © 2019 RIG Enterprise Applications Pvt Ltd. All rights reserved.
//

import UIKit

//MARK:- Pass view to presenter
protocol TeamsVToP: class {
    var view: TeamsPToV? {get set}
    var interactor: TeamsPToI? {get set}
    var router: TeamsPToR? {get set}
    var allData: [AllData]? {get set}
    func getTeamsData()
    func navigateToDetail(navigationController: UINavigationController, data: AllData)
    func sortTeamsBasedOnScore()
}
//MARK:- Pass presenter to router
protocol TeamsPToR: class {
    func navigateToDetail(navigationController: UINavigationController, data: AllData)
}

//MARK:- Pass presenter to interactor
protocol TeamsPToI: class {
    var presenter: TeamsIToP? {get set}
    
    func getTeamsData()
}

//MARK:- Pass interactor to presenter
protocol TeamsIToP: class {
    func loadTeamsData(data: [TeamsEntity])
    func loadMatchesData(data: [MatchesModel])
}

//MARK:- Pass presenter to view
protocol TeamsPToV: class {
    func loadTeamsData(data: [TeamsEntity])
    func loadMatchesData(data: [MatchesModel])
    func sortData(data:[AllData])
}





