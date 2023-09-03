//
//  AcceptLoginViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/30.
//

import UIKit

class AcceptLoginViewController: UIViewController {
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = AcceptLogin.main
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}
