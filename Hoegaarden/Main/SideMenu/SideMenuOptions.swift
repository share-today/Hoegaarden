//
//  SideMenuOptions.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/16.
//

import UIKit

enum SideMenuOptions: Int, CaseIterable {
    case home
    case bundleStory
    case settings
    
    var sideMenuLabel: String {
        switch self {
        case .home: return "홈"
        case .bundleStory: return "이야기 묶음"
        case .settings: return "설정"
        }
    }
}
