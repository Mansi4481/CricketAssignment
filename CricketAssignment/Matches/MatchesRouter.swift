//
//  MatchesRouter.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

class MatchesRouter: MatchesPToR{
    static func createModule(data:AllData) -> MatchesVC {
        let storyBoard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let view = storyBoard.instantiateViewController(withIdentifier: "MatchesVC") as! MatchesVC
        
        let presenter:  MatchesVToP = MatchesPresenter()
        
        view.presenter = presenter
        presenter.matchData = data
        
        return view
    }
}
