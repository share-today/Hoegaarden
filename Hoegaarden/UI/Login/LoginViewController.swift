//
//  LoginViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/03.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let loginView = LoginView()
    
    override func loadView() {
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setLogin()
    }
    
    private func setLogin() {
        googleLoginResult()
        kakaoLoginResult()
        appleLoginResult()
    }
    
    private func googleLoginResult() {
        loginView.googleStartButton.addAction(UIAction(handler: { _ in
//            GoogleLoginManager.shared.signIn(withPresenting: self)
            
            let nextVC = HomeViewController()
            nextVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: nextVC)
            nav.modalPresentationStyle = .overFullScreen
            self.present(nav, animated: true, completion: nil)
        }), for: .touchUpInside)
    }
    
    private func kakaoLoginResult() {
        loginView.kakaoStartButton.addAction(UIAction(handler: { _ in
            
            KakaoLoginManager.loginWithKakao(with: self) { result in
                switch result {
                case .success(let result):
                    
                    let nextVC = HomeViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    let nav = UINavigationController(rootViewController: nextVC)
                    nav.modalPresentationStyle = .overFullScreen
                    self.present(nav, animated: true, completion: nil)
                    
                case .failure(let error):
                    print("Kakao login failed with error: \(error)")
                }
            }
        }), for: .touchUpInside)
    }
    
    private func appleLoginResult() {
        loginView.appleStartButton.addAction(UIAction(handler: { _ in
            
            AppleLoginManager.shared.startAppleLogin { [weak self] result in
                guard let self = self else { return }
                switch result {
                case .success(let result):
                    
                    let nextVC = HomeViewController()
                    nextVC.modalPresentationStyle = .fullScreen
                    let nav = UINavigationController(rootViewController: nextVC)
                    nav.modalPresentationStyle = .overFullScreen
                    self.present(nav, animated: true, completion: nil)
                    
                case .failure(let error):
                    print("Apple login failed with error: \(error)")
                }
            }
        }), for: .touchUpInside)
    }
}
