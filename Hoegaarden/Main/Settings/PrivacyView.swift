//
//  PrivacyView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/31.
//

import UIKit

class PrivacyView: UIViewController {
    
    private var privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보 처리 방침"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var contentView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentLabel)
        return view
    }()
    
    private var contentLabel: UILabel = {
        let cl = UILabel()
        cl.text = "Lorem Ipsum is simply dummy text of \nthe printing and typesetting industry. \nLorem Ipsum has been the industry's \nstandard dummy text ever since the \n1500s, when an unknown printer took \na galley of type and scrambled it to \nmake a type specimen book. It has \nsurvived not only five centuries, but \nalso the leap into electronic \ntypesetting, remaining essentially \nunchanged. It was popularised in the \n1960s with the release of Letraset \nsheets containing Lorem Ipsum \npassages, and more recently with \ndesktop publishing software like Aldus \nPageMaker including versions of \nLorem Ipsum."
        cl.numberOfLines = 0
        cl.textColor = .black
        cl.font = Font.air.of(size: 16)
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
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
        view.addSubview(privacyLabel)
        view.addSubview(lineView)
        view.addSubview(contentView)
        view.addSubview(contentLabel)
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    @objc func showPrevious() {
        let controller = SettingController()
        controller.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: false, completion: nil)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            privacyLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            privacyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            contentView.widthAnchor.constraint(equalToConstant: 327),
            contentView.heightAnchor.constraint(equalToConstant: 408)
        ])
        
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            contentLabel.widthAnchor.constraint(equalToConstant: 327),
            contentLabel.heightAnchor.constraint(equalToConstant: 408)
        ])
    }
}
