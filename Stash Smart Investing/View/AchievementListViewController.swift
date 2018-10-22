//
//  AchievementListViewController.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import UIKit

protocol AchievementListViewProtocol: class {
    var presenter: AchievementListPresenterProtocol? {get set}
    
    // presenter -> view
    func showAchievements(with achievements: [Achievement])
    func showError()
}

class AchievementListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: AchievementListPresenterProtocol?
    var achievementList: [Achievement] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        collectionView.dataSource = self
        
        self.title = "Smart Investing"
    }
    
}

extension AchievementListViewController: AchievementListViewProtocol {
    
    func showAchievements(with achievements: [Achievement]) {
        achievementList = achievements
    }
    
    func showError() {
        let alert = UIAlertController(title: "Error", message: "There was an error retrieving the achievements", preferredStyle: .actionSheet)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension AchievementListViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AchievementCell", for: indexPath) as! AchievementCell
        
        let achievement = achievementList[indexPath.row]
        cell.setup(for: achievement)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return achievementList.count
    }
    
}

