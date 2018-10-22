//
//  AchievementListInteractor.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import Foundation

struct AchievementsResponse: Codable {
    let success: Bool
    let status: Int
    let overview: Overview
    let achievements: [Achievement]
    
    struct Overview: Codable {
        let title: String
    }
}

protocol AchievementListInteractorInputProtocol: class {
    var presenter: AchievementListInteractorOutputProtocol? {get set}
    
    // presenter -> interactor
    func retrieveAchievementsList()
}

class AchievementListInteractor: AchievementListInteractorInputProtocol {
    
    weak var presenter: AchievementListInteractorOutputProtocol?
    
    func retrieveAchievementsList() {
        let url = Bundle.main.url(forResource: "achievements", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let decoder = JSONDecoder()
        
        do {
            let response = try decoder.decode(AchievementsResponse.self, from: data)
            
            if response.success && response.status == 200 {
                presenter?.didRetrieveAchievements(response.achievements)
            } else {
                presenter?.onError()
            }
        } catch {
            presenter?.onError()
        }
    }
}
