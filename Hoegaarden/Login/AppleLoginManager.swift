//
//  AppleLoginManager.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/05/13.
//

import Foundation
import AuthenticationServices
import Alamofire

class AppleLoginManager: NSObject, ASAuthorizationControllerPresentationContextProviding, ASAuthorizationControllerDelegate {
    
    static let shared = AppleLoginManager()
    private var completionHandler: ((Result<String, Error>) -> Void)?
    
    func startAppleLogin(completion: @escaping (Result<String, Error>) -> Void) {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        
        self.completionHandler = completion
        
        if let rootViewController = UIApplication.shared.keyWindow?.rootViewController {
            authorizationController.performRequests()
        }
    }
    
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first!
    }
    
    // Apple ID 연동 성공 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
            
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let idToken = appleIDCredential.identityToken!
            let tokeStr = String(data: idToken, encoding: .utf8)
            
            print("User ID : \(userIdentifier)")
            print("User Email : \(email ?? "")")
            print("User Name : \((fullName?.givenName ?? "") + (fullName?.familyName ?? ""))")
            print("token : \(tokeStr)")
            
            let url = "https://share-today.site/auth/login"
            let parameters = [
                "sns": "sns종류",
                "snsId": "sns고유아이디",
                "email": "이메일",
                "accessToken": "sns로그인후_받은_액세스토큰"
            ]
            
            AF.request(url,
                       method: .post,
                       parameters: parameters)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Response JSON: \(value)")
                    
                    if let json = value as? [String: Any],
                       let data = json["data"] as? [String: Any],
                       let jwt = data["jwt"] as? String {
                        print("jwtjwtjwt: \(jwt)")
                        
                        let defaults = UserDefaults.standard
                        defaults.set(jwt, forKey: "UserJWT")
                    } else {
                        print("JWT not found in response JSON.")
                    }
                case .failure(let error):
                    print("Error: \(error.localizedDescription)")
                }
            }
            self.completionHandler?(.success(appleIDCredential.user))
        default:
            break
        }
    }
    
    // Apple ID 연동 실패 시
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        self.completionHandler?(.failure(error))
    }
}
