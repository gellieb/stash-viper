//
//  AchievementCell.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import UIKit
import AlamofireImage

class AchievementCell: UICollectionViewCell {
    
    @IBOutlet weak var levelNumLabel: UILabel!
    @IBOutlet weak var levelCircleView: UIView!
    @IBOutlet weak var progressBarView: UIView!
    @IBOutlet weak var achievedPointsLabel: UILabel!
    @IBOutlet weak var totalPointsLabel: UILabel!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var overlayView: UIView!
    
    func setup(for achievement: Achievement) {
        self.overlayView.alpha = achievement.accessible ? 0 : 0.5
        self.levelNumLabel.text = achievement.level
        self.achievedPointsLabel.text = "\(achievement.progress) pts"
        self.totalPointsLabel.text = "\(achievement.total) pts"
        self.setBackgroundImage(for: achievement)
        
        self.roundViews()
    }
    
    func setBackgroundImage(for achievement: Achievement) {
        let url = URL(string: achievement.bgImageUrl)!
        backgroundImageView.af_setImage(withURL: url)
    }
    
    func roundViews() {
        levelCircleView.layer.cornerRadius = levelCircleView.frame.size.width/2
        levelCircleView.clipsToBounds = true
        
        progressBarView.layer.cornerRadius = progressBarView.frame.size.height/2
        progressBarView.clipsToBounds = true
        
        self.layer.cornerRadius = 10
    }
    
}
