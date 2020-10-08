//
//  MatchesTVC.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 08/10/20.
//

import UIKit

class MatchesTVC: UITableViewCell {
    @IBOutlet weak var lblMatchTitle:UILabel?
    @IBOutlet weak var viewMain:UIView?

    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    //display data
    func loadData(data:MatchesDetailModel){
        self.lblMatchTitle?.text = data.title
        self.viewMain?.backgroundColor = data.isWinner ? UIColor.green : (data.isLoser ? UIColor.red : UIColor.clear)
    }
}
