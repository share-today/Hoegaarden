//
//  AppDelegate.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/03.
//

import UIKit
import FirebaseCore
import FirebaseAuth
import GoogleSignIn
import KakaoSDKCommon
import KakaoSDKAuth

//@main
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let launchScreenVC = LaunchScreenViewController()
        
        // LaunchScreenViewController를 rootViewController로 설정하고, 윈도우에 등록합니다.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = launchScreenVC
        window?.makeKeyAndVisible()
        
        FirebaseApp.configure()
        
        GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
            if error != nil || user == nil { } else { }
        }
        
        KakaoSDK.initSDK(appKey: "4b156aaa5781831d5b2a4dd7d4370fc1")
        
        return true
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        var handled: Bool
        
        handled = GIDSignIn.sharedInstance.handle(url)
        if handled {
            return true
        }
        
        return false
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}
