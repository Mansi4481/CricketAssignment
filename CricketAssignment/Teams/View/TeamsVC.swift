//
//  TeamsVC.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit
import Alamofire

class TeamsVC: UIViewController {
    @IBOutlet weak var tableView:UITableView?
    
    var presenter: TeamsVToP?
    var teams = [TeamsEntity]()
    var matches = [MatchesModel]()
    var allData = [AllData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initData()
        self.presenter?.getTeamsData()
    }
    func initData(){
        //Initialization to VIPER
        let presenter:  TeamsIToP & TeamsVToP = TeamsPresenter()
        let interactor: TeamsPToI = TeamsInteractor()
        let router: TeamsPToR = TeamsRouter()
        
        self.presenter = presenter
        presenter.view = self
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        //right bar button item
        let barItem = UIBarButtonItem(image: UIImage(named: "ic_sort"), style: .plain , target: self, action: #selector(sortClicked))
        self.navigationItem.rightBarButtonItem = barItem
    }
    //sort action
    @objc func sortClicked(){
        self.presenter?.sortTeamsBasedOnScore()
    }
}
//MARK:- Presenter to view methods
extension TeamsVC: TeamsPToV{
    //get match data from API
    func loadMatchesData(data: [MatchesModel]) {
        self.matches = data
        self.allData = AllData.loadAllData(teams: self.teams, matches: self.matches)
        presenter?.allData = self.allData
        self.tableView?.reloadData()
    }
    //get team data from API
    func loadTeamsData(data: [TeamsEntity]){
        self.teams = data
        self.tableView?.tableFooterView = UIView()
    }
    //sorting based on points
    func sortData(data:[AllData]){
        self.allData = data
        self.tableView?.reloadData()
    }
}
//MARK:- Tableview delegate methods
extension TeamsVC: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamsTVC") as! TeamsTVC
        cell.loadData(data: allData[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.navigateToDetail(navigationController: self.navigationController!, data: allData[indexPath.row])
    }
}
