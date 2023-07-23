//
//  LoginView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/02.
//

import UIKit

class LoginView: UIView {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleView)
        imageView.addSubview(logoStackView)
        imageView.addSubview(loginButtonstackView)
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
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Title.mainTitle
        label.textColor = .black
        label.font = Font.bold.of(size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let logoImageTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "subtractTop")
        return imageView
    }()
    
    private let logoImageBottom: UIImageView = {
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
    
    let googleStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "google"), for: .normal)
        button.setTitle(Login.googleLogin, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1).cgColor
        button.titleLabel?.font = Font.bold.of(size: 16)
        return button
    }()
    
    let kakaoStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "kakao"), for: .normal)
        button.setTitle(Login.kakaoLogin, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 4
        button.titleLabel?.font = Font.bold.of(size: 16)
        return button
    }()
    
    let appleStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "apple"), for: .normal)
        button.setTitle(Login.appleLogin, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.titleLabel?.font = Font.bold.of(size: 16)
        return button
    }()
    
    private lazy var loginButtonstackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [googleStartButton, kakaoStartButton, appleStartButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        [backgroundImage].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            titleView.topAnchor.constraint(equalTo: backgroundImage.safeAreaLayoutGuide.topAnchor, constant: 180),
            titleView.widthAnchor.constraint(equalToConstant: 224),
            titleView.heightAnchor.constraint(equalToConstant: 100),
            titleView.centerXAnchor.constraint(equalTo: backgroundImage.centerXAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor),
            
            logoImageTop.widthAnchor.constraint(equalToConstant: 78),
            logoImageTop.heightAnchor.constraint(equalToConstant: 38),
            
            logoImageBottom.widthAnchor.constraint(equalToConstant: 78),
            logoImageBottom.heightAnchor.constraint(equalToConstant: 38),
            
            logoStackView.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 70),
            logoStackView.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 180),
            
            loginButtonstackView.bottomAnchor.constraint(equalTo: backgroundImage.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            loginButtonstackView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 30),
            loginButtonstackView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -30),
            loginButtonstackView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
}
