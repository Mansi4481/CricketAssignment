//
//  MatchesVC.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

class MatchesVC: UIViewController {
    var presenter: MatchesVToP?
    @IBOutlet weak var tableView:UITableView?
    var matchesData = AllData()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.matchesData = presenter?.matchData ?? AllData()
        self.tableView?.reloadData()
        self.navigationItem.title = matchesData.name
        self.tableView?.tableFooterView = UIView()

    }
}
//MARK:- Tableview delegate methods
extension MatchesVC:UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchesData.newMatches.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MatchesTVC") as! MatchesTVC
        cell.loadData(data: matchesData.newMatches[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
