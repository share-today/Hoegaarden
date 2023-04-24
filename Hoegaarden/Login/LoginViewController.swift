//
//  LoginViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/03.
//

import UIKit
import Firebase
import FirebaseAuth
import GoogleSignIn
import KakaoSDKUser
import AuthenticationServices

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
    
    @objc private func googleLoginStartButton(sender: Any) {
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { signInResult, error in
            guard error == nil else { return }
            guard let signInResult = signInResult else { return }
            
            let user = signInResult.user
            let emailAddress = user.profile?.email
            let fullName = user.profile?.name
            let token = user.accessToken
            let refreshToken = user.refreshToken
            let idToken = user.idToken
            
            print("user: \(signInResult.user)")
            print("email: \(user.profile?.email ?? "no email")")
            print("name: \(user.profile?.name ?? "no userName")")
            print("token: \(user.accessToken)")
            print("refreshToken: \(user.refreshToken)")
            print("idToken: \(user.idToken)")
        }
    }
        
    @objc private func kakaoLoginStartButton(_ sender: UIButton) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카톡 설치 되어 있으면 카톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오톡으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            guard let userId = user?.id else { return }
                            print("nickname: \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
                            print("email: \(user?.kakaoAccount?.email ?? "no email")")
                            print("userID: \(userId)")
                        }
                    }
                }
            }
        } else {
            // 카톡 없으면 계정 입력하여 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    print(error)
                } else {
                    print("카카오 계정으로 로그인 성공")
                    
                    _ = oauthToken
                    // 관련 메소드 추가
                    UserApi.shared.me {(user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("nickname: \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
                            print("email: \(user?.kakaoAccount?.email ?? "no email")")
                            
                            guard let userId = user?.id else {return}
                            
                            print("닉네임 : \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")\n이메일 : \(user?.kakaoAccount?.email ?? "no nickname")\n유저 ID : \(userId)")
                        }
                    }
                }
            }
        }
    }
    
    @objc private func appleLoginStartButton() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
//        let nextVC = HomeViewController()
//        nextVC.modalPresentationStyle = .fullScreen
//        let nav = UINavigationController(rootViewController: nextVC)
//        nav.modalPresentationStyle = .overFullScreen
//        present(nav, animated: true, completion: nil)
    }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            // Apple ID
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            // 계정 정보 가져오기
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let idToken = appleIDCredential.identityToken!
            let tokeStr = String(data: idToken, encoding: .utf8)
            
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            print("token : \(String(describing: tokeStr))")
            
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        // Handle error.
    }
}
