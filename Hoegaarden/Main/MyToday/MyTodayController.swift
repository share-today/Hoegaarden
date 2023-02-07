//
//  MyTodayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyTodayController: UIViewController {
    
    let page: Int
    private let myToday = MyToday()
    
    init(page: Int) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = myToday
    }
}
