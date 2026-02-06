//
//  AppDelegate.swift
//  Basic_UI_Practice
//
//  Created by OBMac-13 on 22/01/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var pendingShortcutItem: UIApplicationShortcutItem?
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateInitialViewController()
//
//        viewController.view.backgroundColor = .blue
        window?.rootViewController = viewController
//        window?.makeKey()
        window?.makeKeyAndVisible()

//
        
//        let viewController1 = storyBoard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//        viewController.view.backgroundColor = .systemPink
//        windowSecond?.rootViewController = viewController1
//        windowSecond?.makeKeyAndVisible()
        
        print(#function)
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
    func application(
        _ application: UIApplication,
        performActionFor shortcutItem: UIApplicationShortcutItem,
        completionHandler: @escaping (Bool) -> Void
    ) {
        pendingShortcutItem = shortcutItem
        completionHandler(true)
    }
    
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
      print(#function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }
    

    

   



}

