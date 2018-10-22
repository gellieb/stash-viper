//
//  AchievementListWireframe.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import UIKit

protocol AchievementListWireframeProtocol: class {
    static func createAchievementListModule() -> UIViewController
}

class AchievementListWireframe: AchievementListWireframeProtocol {
    
    static func createAchievementListModule() -> UIViewController {
        
        let nav = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AchievementsNavigationController")
        if let view = nav.children.first as? AchievementListViewController {
            let presenter: AchievementListPresenterProtocol & AchievementListInteractorOutputProtocol = AchievementListPresenter()
            let interactor: AchievementListInteractorInputProtocol = AchievementListInteractor()
            
            view.presenter = presenter
            presenter.view = view
            presenter.interactor = interactor
            interactor.presenter = presenter
            
            return nav
        } else {
            return UIViewController()
        }
    }
    
}
