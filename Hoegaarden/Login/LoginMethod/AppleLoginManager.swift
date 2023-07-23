//
//  AppleLoginManager.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/05/13.
//

//import AuthenticationServices
//import Alamofire
//
//class AppleLoginManager: UIViewController {
//    
//    static func loginWithApple(with viewController: UIViewController, completion: @escaping (Result<String, Error>) -> Void) {
//        let appleIDProvider = ASAuthorizationAppleIDProvider()
//        let request = appleIDProvider.createRequest()
//        request.requestedScopes = [.fullName, .email]
//        
//        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
//        authorizationController.delegate = self
//        authorizationController.presentationContextProvider = self
//        authorizationController.performRequests()
//    }
//}
//
//extension AppleLoginManager: ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
//    
//    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
//        return self.view.window!
//    }
//
//    // Apple ID 연동 성공 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
//        switch authorization.credential {
//            // Apple ID
//        case let appleIDCredential as ASAuthorizationAppleIDCredential:
//
//            // 계정 정보 가져오기
//            let userIdentifier = appleIDCredential.user
//            let fullName = appleIDCredential.fullName
//            let email = appleIDCredential.email
//            let idToken = appleIDCredential.identityToken!
//            let tokeStr = String(data: idToken, encoding: .utf8)
//
//            print("User ID : \(userIdentifier)")
//            print("User Email : \(email ?? "")")
//            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
//            print("token : \(tokeStr)")
//
//            let url = "https://share-today.site/auth/login"
//            let parameters = [
//                "sns": "sns종류",
//                "snsId": "sns고유아이디",
//                "email": "이메일",
//                "accessToken": "sns로그인후_받은_액세스토큰"
//            ]
//
//            AF.request(url, method: .post, parameters: parameters)
//                .validate()
//                .responseJSON { response in
//                    switch response.result {
//                    case .success(let value):
//                        print("Response JSON: \(value)")
//
//                        let userDefaults = UserDefaults.standard
//                        userDefaults.set(true, forKey: "isLoggedIn")
//                        userDefaults.set(userIdentifier, forKey: "userID")
//
//                        let nextVC = HomeViewController()
//                        nextVC.modalPresentationStyle = .fullScreen
//                        let nav = UINavigationController(rootViewController: nextVC)
//                        nav.modalPresentationStyle = .overFullScreen
//                        self.present(nav, animated: true, completion: nil)
//
//                    case .failure(let error):
//                        print("Error: \(error.localizedDescription)")
//                    }
//                }
//        default:
//            break
//        }
//    }
//
//    // Apple ID 연동 실패 시
//    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
//        // Handle error.
//    }
//}
