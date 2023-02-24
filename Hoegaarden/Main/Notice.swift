//
//  Notice.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit

class Notice: UIViewController {
    
    private var noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .black
        label.font = UIFont(name: "Cafe24Ssurround", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        configureNavigationBarButton()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        view.addSubview(noticeLabel)
        view.addSubview(lineView)
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    @objc func showPrevious() {
        let controller = HomeSide()
        controller.modalPresentationStyle = .overFullScreen
        self.present(controller, animated: false)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            noticeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            noticeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: noticeLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}
