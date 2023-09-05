//
//  DiaryLocalDataSource.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/12.
//

import Foundation
import Alamofire

class DiaryLocalDataSource {
    
    static let shared = DiaryLocalDataSource()
    
    private let baseURL = "https://share-today.site"
    
    func sendMyToday(content: String, completion: @escaping (Result<Int, Error>) -> Void) {
        let url = "\(baseURL)/diary"
        
        let parameters = [
            "content": content
        ]
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            AF.request(url,
                       method: .post,
                       parameters: parameters,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Diary Response JSON: \(value)")
                case .failure(let error):
                    print("Diary Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func getMyToday(id: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseURL)/diary/\(id)"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            AF.request(url,
                       method: .get,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Get Diary Response JSON: \(value)")
                    
                    if let json = value as? [String: Any],
                       let data = json["data"] as? [String: Any],
                       let diary = data["diary"] as? [String: Any],
                       let diaryDate = diary["created_at"] as? String,
                       let diaryContent = diary["content"] as? String {
                        completion(.success(diaryContent))
                        print("다이어리 생성 날짜: \(diaryDate)")
                    }
                case .failure(let error):
                    print("Get Diary Response JSON: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func modifyMyToday(id: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseURL)/diary/\(id)"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            let parameters = [
                "content": "update_test"
            ]
            
            AF.request(url,
                       method: .put,
                       parameters: parameters,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Modify Diary Response JSON: \(value)")
                case .failure(let error):
                    print("Modify Diary Error: \(error.localizedDescription)")
                    
                }
            }
        }
    }
    
    func deleteMyToday(id: Int, completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseURL)/diary/\(id)"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            AF.request(url,
                       method: .delete,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Delete Diary Response JSON: \(value)")
                case .failure(let error):
                    print("Delete Diary Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func checkHaru(completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseURL)/diary/haru"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
        
            AF.request(url,
                       method: .get,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("check Haru Response JSON: \(value)")
                case .failure(let error):
                    print("check Haru Error: \(error.localizedDescription)")
                }
            }
        }
    }
    
    
    func getCalendarDiary(completion: @escaping (Result<String, Error>) -> Void) {
        let url = "\(baseURL)/calendar"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
        
            AF.request(url,
                       method: .get,
                       headers: headers)
            .validate()
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    print("Calendar Diary Response JSON: \(value)")
                case .failure(let error):
                    print("Calendar Diary Error: \(error.localizedDescription)")
                }
            }
        }
    }
}
