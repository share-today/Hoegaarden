//
//  MyYesterdayViewModel.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/03.
//

import Foundation

class MyYesterdayViewModel {
    
    private var localDataSource = DiaryLocalDataSource()
    
    init() {
        localDataSource = DiaryLocalDataSource.shared
    }
    
    func getMyYesterday() {
        
    }
    
    func getMyYesterdayComment() {
        
    }
}
