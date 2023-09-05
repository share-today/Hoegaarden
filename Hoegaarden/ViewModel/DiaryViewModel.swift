//
//  DiaryViewModel.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/03.
//

import Foundation

class DiaryViewModel {
    
    private var localDataSource = DiaryLocalDataSource()
    
    init() {
        localDataSource = DiaryLocalDataSource.shared
    }
    
    func addMyToday(content: String, completion: @escaping (Result<Int, any Error>) -> Void) {
        localDataSource.sendMyToday(content: content, completion: completion)
    }
    
    func getMyToday(id: Int, completion: @escaping (Result<String, any Error>) -> Void) {
        localDataSource.getMyToday(id: id, completion: completion)
    }
    
    func modifyMyToday(id: Int, completion: @escaping (Result<String, any Error>) -> Void) {
        localDataSource.modifyMyToday(id: id, completion: completion)
    }
    
    func deleteMyToday(id: Int, completion: @escaping (Result<String, any Error>) -> Void) {
        localDataSource.deleteMyToday(id: id, completion: completion)
    }
}
