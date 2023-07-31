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
        
        setupAddTarget()
    }
    
    private func setupAddTarget() {
        loginView.googleStartButton.addTarget(self, action: #selector(googleLoginStartButton), for: .touchUpInside)
        loginView.kakaoStartButton.addTarget(self, action: #selector(kakaoLoginStartButton), for: .touchUpInside)
        loginView.appleStartButton.addTarget(self, action: #selector(appleLoginStartButton), for: .touchUpInside)
    }
    
    @objc private func googleLoginStartButton() {
//        GoogleLoginManager.shared.signIn(withPresenting: self)
        let nextVC = HomeViewController()
        nextVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: nextVC)
        nav.modalPresentationStyle = .overFullScreen
        self.present(nav, animated: true, completion: nil)
    }
        
    @objc private func kakaoLoginStartButton() {
        KakaoLoginManager.loginWithKakao(with: self) { result in
            switch result {
            case .success(let userId):
                print("Kakao login success with user id: \(userId)")
                
                let nextVC = HomeViewController()
                nextVC.modalPresentationStyle = .fullScreen
                let nav = UINavigationController(rootViewController: nextVC)
                nav.modalPresentationStyle = .overFullScreen
                self.present(nav, animated: true, completion: nil)
                
            case .failure(let error):
                print("Kakao login failed with error: \(error)")
            }
        }
    }
    
    @objc private func appleLoginStartButton() {
        AppleLoginManager.shared.startAppleLogin { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let userId):
                print("Apple login success with user id: \(userId)")
                
                let nextVC = HomeViewController()
                nextVC.modalPresentationStyle = .fullScreen
                let nav = UINavigationController(rootViewController: nextVC)
                nav.modalPresentationStyle = .overFullScreen
                self.present(nav, animated: true, completion: nil)
                
            case .failure(let error):
                print("Apple login failed with error: \(error)")
            }
        }
    }
}
