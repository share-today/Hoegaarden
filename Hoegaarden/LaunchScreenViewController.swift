//
//  LaunchScreenViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/14.
//

import UIKit

class LaunchScreenViewController: UIViewController {
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.layer.borderColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = Title.mainTitle
        label.textColor = .black
        label.font = Font.bold.of(size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var logoImageTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "subtractTop")
        return imageView
    }()
    
    private var logoImageBottom: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "subtractBottom")
        return imageView
    }()
    
    private lazy var logoStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [logoImageTop, logoImageBottom])
        view.spacing = 10
        view.axis = .vertical
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(titleView)
        backgroundImage.addSubview(logoStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            titleView.widthAnchor.constraint(equalToConstant: 224),
            titleView.heightAnchor.constraint(equalToConstant: 86),
            titleView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            titleView.centerYAnchor.constraint(equalTo: backgroundImage.centerYAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            logoStackView.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 60),
            logoStackView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 180),
            logoStackView.widthAnchor.constraint(equalToConstant: 148),
            logoStackView.heightAnchor.constraint(equalToConstant: 108)
        ])
    }
}
