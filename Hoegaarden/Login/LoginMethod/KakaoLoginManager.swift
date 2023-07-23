//
//  KakaoLoginManager.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/05/13.
//

import KakaoSDKAuth
import KakaoSDKUser

class KakaoLoginManager {
    
    static func loginWithKakao(with viewController: UIViewController, completion: @escaping (Result<String, Error>) -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            // 카카오톡 설치 되어 있으면 카카오톡으로 로그인
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    _ = oauthToken
                    UserApi.shared.me { (user, error) in
                        if let error = error {
                            completion(.failure(error))
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
            // 카카오톡 설치 되어 있지 않으면 계정을 입력하여 로그인
            UserApi.shared.loginWithKakaoAccount { (oauthToken, error) in
                if let error = error {
                    completion(.failure(error))
                } else {
                    _ = oauthToken
                    UserApi.shared.me { (user, error) in
                        if let error = error {
                            completion(.failure(error))
                        } else {
                            guard let userId = user?.id else { return }
                            print("nickname: \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
                            print("email: \(user?.kakaoAccount?.email ?? "no email")")
                            print("userID: \(userId)")
                        }
                    }
                }
            }
        }
    }
}
