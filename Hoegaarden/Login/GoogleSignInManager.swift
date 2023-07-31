//
//  GoogleSignInManager.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/05/13.
//

import GoogleSignIn

class GoogleLoginManager {
    static let shared = GoogleLoginManager()
    
    func signIn(withPresenting presentingViewController: UIViewController) {
        
        GIDSignIn.sharedInstance.signIn(withPresenting: presentingViewController) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            
            print("user: \(signInResult.user)")
            print("email: \(user.profile?.email ?? "no email")")
            print("name: \(user.profile?.name ?? "no userName")")
            print("token: \(user.accessToken)")
            print("refreshToken: \(user.refreshToken)")
            print("idToken: \(user.idToken)")
            
            let userDefaults = UserDefaults.standard
            userDefaults.set(true, forKey: "isLoggedIn")
            userDefaults.set(signInResult.user, forKey: "userID")
        }
    }
}
