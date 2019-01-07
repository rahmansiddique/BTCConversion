//
//  AppDelegate.swift
//  BTC Conversion
//
//  Created by Inam ur Rehman on 07/01/2019.
//  Copyright © 2019 Lango. All rights reserved.
//

import UIKit

//Public key: ZDEwNzViMWU0YzJmNDJmY2EyMDA5OTlmMGI1ZWFlOTY
//Secret key:  YmFhNGU2NGYyZmE3NGRkNmJlY2NhNTlhYmQ3MWJkZGQ5ZjkyZDZmNTEzYWQ0MTQ3YjFmZTIzMTMxNzlmMzY0MA 

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Move to currency VC
        moveToCurrencyVC()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        popDetailsVC()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        popDetailsVC()
    }


    func moveToCurrencyVC(){
        if !dataManager.getUserName().isEmpty{
            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let viewController = mainStoryboard.instantiateViewController(withIdentifier: "SelectCurrencyNC") as! UINavigationController
            window?.rootViewController = viewController
        }
    }
    
    func popDetailsVC(){
        guard let rootNC = window?.rootViewController as? UINavigationController else {return}
        rootNC.popToRootViewController(animated: false)
    }
    
}

