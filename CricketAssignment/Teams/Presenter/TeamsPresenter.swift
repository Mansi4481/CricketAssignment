//
//  TeamsPresenter.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

class TeamsPresenter : TeamsVToP{
    var view: TeamsPToV?
    var interactor: TeamsPToI?
    var router: TeamsPToR?
    var allData: [AllData]?
    
    //request to get team data from API
    func getTeamsData(){
        self.interactor?.getTeamsData()
    }
    //sorting action handled
    func sortTeamsBasedOnScore(){
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "Sort by", message: nil, preferredStyle: .actionSheet)
        
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            print("Cancel")
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        
        let saveActionButton = UIAlertAction(title: "Points (High to Low)", style: .default)
        { _ in
            self.allData = self.allData?.sorted(by: { $0.totalPoint > $1.totalPoint })
            self.view?.sortData(data: self.allData ?? [])
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let deleteActionButton = UIAlertAction(title: "Points (Low to High)", style: .default)
        { _ in
            self.allData = self.allData?.sorted(by: { $0.totalPoint < $1.totalPoint })
            self.view?.sortData(data: self.allData ?? [])
        }
        actionSheetControllerIOS8.addAction(deleteActionButton)
        (self.view as! UIViewController).present(actionSheetControllerIOS8, animated: true, completion: nil)
    }
    //Navigate to detail screen
    func navigateToDetail(navigationController: UINavigationController, data:AllData) {
        self.router?.navigateToDetail(navigationController: navigationController, data: data)
    }
    
}
//MARK:- Interactor to view methods
extension TeamsPresenter : TeamsIToP{
    //got teams data from API
    func loadTeamsData(data: [TeamsEntity]){
        self.view?.loadTeamsData(data: data)
    }
    //got matches data from API
    func loadMatchesData(data: [MatchesModel]){
        self.view?.loadMatchesData(data: data)
    }
}
