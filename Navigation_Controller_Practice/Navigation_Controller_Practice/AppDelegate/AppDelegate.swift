//
//  AppDelegate.swift
//  Navigation_Controller_Practice
//
//  Created by OBMac-13 on 02/02/26.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch
        
        let FirstVC = storyboardOfMain.instantiateViewController(
            withIdentifier: "ViewController") as! ViewController
        let nav = UINavigationController(rootViewController: FirstVC) // when using this
        nav.setupNavigationBar()
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
            
        
        
       
        
//            window = UIWindow(windowScene: windowScene)
//            let vc = storyBoardOfMain.instantiateViewController(withIdentifier: "ViewController") as! ViewController
//            let navigationController = UINavigationController(rootViewController: vc)
//            window?.rootViewController = navigationController
//            window?.makeKeyAndVisible()

        
        return true
    }

    // MARK: UISceneSession Lifecycle

//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }

//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
            
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }


}

