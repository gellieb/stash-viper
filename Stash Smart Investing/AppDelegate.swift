//
//  AppDelegate.swift
//  Stash Smart Investing
//
//  Created by Angel Chang on 10/21/18.
//  Copyright © 2018 Angel Chang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let achievementsList = AchievementListWireframe.createAchievementListModule()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = achievementsList
        window?.makeKeyAndVisible()

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
    }

}

