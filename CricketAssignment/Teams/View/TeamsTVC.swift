//
//  TeamsTVC.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

class TeamsTVC: UITableViewCell {
    @IBOutlet weak var imgTeam:UIImageView?
    @IBOutlet weak var lblTitle:UILabel?
    @IBOutlet weak var lblSubTitle:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    //display data
    func loadData(data:AllData){
        self.lblTitle?.text = data.name
        self.lblSubTitle?.text = data.subTitle
        self.imgTeam?.load(imgString: data.img)
    }
}

//MARK: - Load Image from remote URL extension
extension UIImageView {
    func load(imgString: String) {
        let url = URL(string: imgString)
        if url != nil{
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.image = image
                        }
                    }
                }
            }
        }
    }
}
