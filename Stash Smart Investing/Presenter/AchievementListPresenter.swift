//
//  AchievementListPresenter.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import Foundation

protocol AchievementListPresenterProtocol: class {
    var view: AchievementListViewProtocol? {get set}
    var interactor: AchievementListInteractorInputProtocol? {get set}
    var router: AchievementListWireframeProtocol? {get set}
    
    // view -> protocol
    func viewDidLoad()
}

protocol AchievementListInteractorOutputProtocol: class {
    // interactor -> presenter
    func didRetrieveAchievements(_ achievements: [Achievement])
    func onError()
}

class AchievementListPresenter: AchievementListPresenterProtocol {
    
    weak var view: AchievementListViewProtocol?
    var interactor: AchievementListInteractorInputProtocol?
    var router: AchievementListWireframeProtocol?
    
    func viewDidLoad() {
        interactor?.retrieveAchievementsList()
    }
    
}

extension AchievementListPresenter: AchievementListInteractorOutputProtocol {
    
    func didRetrieveAchievements(_ achievements: [Achievement]) {
        view?.showAchievements(with: achievements)
    }
    
    func onError() {
        view?.showError()
    }
    
}
