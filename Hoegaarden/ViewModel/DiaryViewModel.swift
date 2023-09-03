//
//  DiaryViewModel.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/03.
//

import Foundation

class DiaryViewModel {
    
    private var localDataSource = MyTodayLocalDataSource()
    
    private init() {
        localDataSource = MyTodayLocalDataSource.shared
    }
    
    func addMyToday(content: String, completion: @escaping (Result<Int, any Error>) -> Void) {
        localDataSource.sendMyToday(content: content, completion: completion)
    }
    
    
}
