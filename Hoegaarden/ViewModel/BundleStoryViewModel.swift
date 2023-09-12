//
//  BundleStoryViewModel.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/05.
//

import UIKit

class BundleStoryViewModel {
    
    private var localDataSource = DiaryLocalDataSource()
    
    init() {
        localDataSource = DiaryLocalDataSource.shared
    }
    
    func getCalendar(completion: @escaping (Result<Data, Error>) -> Void) {
        localDataSource.getCalendarDiary(completion: completion)
    }
}
