//
//  TeamsRouter.swift
//  CricketAssignment
//
//  Created by RIG00015MAC on 07/10/20.
//

import UIKit

class TeamsRouter: TeamsPToR{
    func navigateToDetail(navigationController: UINavigationController, data: AllData) {
        let detailVC = MatchesRouter.createModule(data: data)
        navigationController.pushViewController(detailVC, animated: true)
    }
}
