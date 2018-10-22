//
//  AchievementListInteractorSpec.swift
//  Stash Smart InvestingTests
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import XCTest
import Quick
import Nimble

@testable import Stash_Smart_Investing

class Mock_AchievementListInteractorOutputProtocol: AchievementListInteractorOutputProtocol {
    
    var achievements: [Achievement] = []
    var didReturnError: Bool = false
    
    func didRetrieveAchievements(_ achievements: [Achievement]) {
        self.achievements = achievements
    }
    
    func onError() {
        didReturnError = true
    }
    
}

class AchievementListInteractorSpec: QuickSpec {

    private var testObject: AchievementListInteractor!
    private var testUrlFail = Bundle.main.url(forResource: "mock_achievements", withExtension: "json")!
    private var testUrlSuccess = Bundle.main.url(forResource: "achievements", withExtension: "json")!
    private var testPresenter: Mock_AchievementListInteractorOutputProtocol!
    
    override func spec() {
        
        describe("An Achievement List Interactor") {
            
            beforeEach {
                self.testObject = AchievementListInteractor()
                self.testPresenter = Mock_AchievementListInteractorOutputProtocol()
                self.testObject.presenter = self.testPresenter
            }
            
            afterEach {
                self.testObject = nil
                self.testPresenter = nil
            }
            
            context("when successfully retrieving achievements") {
                
                beforeEach {
                    self.testObject.retrieveAchievementsList(fromUrl: self.testUrlSuccess)
                }
                
                afterEach {
                    self.testPresenter.achievements = []
                }
                
                it("returns 3 achievements") {
                    expect(self.testPresenter.achievements.count) == 3
                }
                
                it("does not return an error") {
                    expect(self.testPresenter.didReturnError).to(beFalse())
                }
            }
            
            context("when failing to retrieve achievements") {
                
                beforeEach {
                    self.testObject.retrieveAchievementsList(fromUrl: self.testUrlFail)
                }
                
                afterEach {
                    self.testPresenter.achievements = []
                }
                
                it("returns 0 achievements") {
                    expect(self.testPresenter.achievements.count) == 0
                }
                
                it("returns an error") {
                    expect(self.testPresenter.didReturnError).to(beTrue())
                }
                
            }
            
        }
        
    }

}
