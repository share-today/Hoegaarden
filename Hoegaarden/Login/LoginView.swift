//
//  LoginView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/02.
//

import UIKit

class LoginView: UIView {
    
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
        label.text = "하루 공유"
        label.textColor = .black
        label.font = Font.bold.of(size: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var imageViewTop: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "subtractTop")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var imageViewBottom: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "subtractBottom")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var kakaoStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "kakao"), for: .normal)
        button.setTitle("  카카오톡으로 로그인", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 4
        button.titleLabel?.font = Font.bold.of(size: 16)
        return button
    }()
    
    lazy var appleStartButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "apple"), for: .normal)
        button.setTitle("  Apple로 로그인", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.layer.cornerRadius = 4
        button.titleLabel?.font = Font.bold.of(size: 16)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [kakaoStartButton, appleStartButton])
        stview.spacing = 18
        stview.axis = .vertical
        stview.distribution = .fillEqually
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    private let textViewHeight: CGFloat = 48
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        [titleView, stackView, imageViewTop, imageViewBottom].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: 220),
            titleView.widthAnchor.constraint(equalToConstant: 224),
            titleView.heightAnchor.constraint(equalToConstant: 100),
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: titleView.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: titleView.centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageViewTop.topAnchor.constraint(equalTo: titleView.topAnchor, constant: 70),
            imageViewTop.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 180),
            imageViewTop.widthAnchor.constraint(equalToConstant: 78),
            imageViewTop.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            imageViewBottom.topAnchor.constraint(equalTo: imageViewTop.bottomAnchor, constant: 3),
            imageViewBottom.leadingAnchor.constraint(equalTo: titleView.leadingAnchor, constant: 180),
            imageViewBottom.widthAnchor.constraint(equalToConstant: 78),
            imageViewBottom.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3),
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 240)
        ])
    }
}
