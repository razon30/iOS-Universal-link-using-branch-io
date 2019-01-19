//
//  AppDelegate.swift
//  iOS Universal Lisk using Branch iO
//
//  Created by Razon Hossain on 1/19/19.
//  Copyright © 2019 razon. All rights reserved.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        setupBranchIO(launchOptions: launchOptions)
        
        return true
    }
    
    //================on unioversal lins===============
    func setupBranchIO(launchOptions: [UIApplication.LaunchOptionsKey: Any]?)  {
        
        Branch.getInstance()?.initSession(launchOptions: launchOptions){ (params, error) in
            
           
            
        }
        
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        Branch.getInstance()?.application(app, open: url, options: options)
        return true
    }
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
       Branch.getInstance()?.continue(userActivity)
        
        let value = Branch.getInstance()?.getLatestReferringParams()
        print(value!["\"key\""]!)
        
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any]) {
        Branch.getInstance()?.handlePushNotification(userInfo)
    }
    

 //================on unioversal lins===============

}

