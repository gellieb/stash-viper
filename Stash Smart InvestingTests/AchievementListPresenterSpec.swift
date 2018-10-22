//
//  AchievementListPresenterSpec.swift
//  Stash Smart InvestingTests
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import Stash_Smart_Investing

class Mock_AchievementListViewProtocol: AchievementListViewProtocol {
    var presenter: AchievementListPresenterProtocol?
    
    var didShowAchievements: Bool = false
    var didShowError: Bool = false
    
    func showAchievements(with achievements: [Achievement]) {
        didShowAchievements = true
    }
    
    func showError() {
        didShowError = true
    }
    
}

class Mock_AchievementListInteractorInputProtocol: AchievementListInteractorInputProtocol {
    var presenter: AchievementListInteractorOutputProtocol?
    
    var didReceiveCallToRetrieveAchievements: Bool = false
    
    func retrieveAchievementsList(fromUrl url: URL) {
        didReceiveCallToRetrieveAchievements = true
    }
    
}


class AchievementListPresenterSpec: QuickSpec {

    private var testObject: AchievementListPresenter!
    private var testView: Mock_AchievementListViewProtocol!
    private var testInteractor: Mock_AchievementListInteractorInputProtocol!
    private var testAchievement1 = Achievement(id: 1, level: "2", progress: 50, total: 100, bgImageUrl: "TEST_URL", accessible: true)
    private var testAchievement2 = Achievement(id: 2, level: "3", progress: 20, total: 50, bgImageUrl: "TEST_URL_2", accessible: false)
    
    override func spec() {
        
        describe("An Achievement List Presenter") {
            
            beforeEach {
                self.testObject = AchievementListPresenter()
                self.testView = Mock_AchievementListViewProtocol()
                self.testObject.view = self.testView
                self.testInteractor = Mock_AchievementListInteractorInputProtocol()
                self.testObject.interactor = self.testInteractor
            }
            
            afterEach {
                self.testObject = nil
                self.testView = nil
                self.testInteractor = nil
            }
            
            context("when loading the view with a valid response") {
                beforeEach {
                    let achievements = [self.testAchievement1, self.testAchievement2]
                    self.testObject.viewDidLoad()
                    self.testObject.didRetrieveAchievements(achievements)
                }
                
                it("notifies to the interactor to retrieve the achievements") {
                    expect(self.testInteractor.didReceiveCallToRetrieveAchievements).to(beTrue())
                }
                
                it("notifies the view to show the achievements") {
                    expect(self.testView.didShowAchievements).to(beTrue())
                }
                
            }
            
            context("when loading the view with a url with invalid response") {
                beforeEach {
                    self.testObject.viewDidLoad()
                    self.testObject.onError()
                }
                
                it("notifies to the interactor to retrieve the achievements") {
                    expect(self.testInteractor.didReceiveCallToRetrieveAchievements).to(beTrue())
                }
                
                it("notifies to the interactor to retrieve the achievements") {
                    expect(self.testInteractor.didReceiveCallToRetrieveAchievements).to(beTrue())
                }
                
                it("notifies the view to show the achievements") {
                    expect(self.testView.didShowAchievements).to(beFalse())
                }
                
                it("notifies the view to show an error") {
                    expect(self.testView.didShowError).to(beTrue())
                }
                
            }
            
        }
        
    }

}
