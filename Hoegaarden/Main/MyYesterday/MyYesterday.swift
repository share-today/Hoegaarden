//
//  MyYesterday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyYesterday: UIView {
    
    lazy var myYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(myYesterdayDateLabel)
        view.addSubview(myYesterdayContentLabel)
        view.addSubview(myYesterdayMoreButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var myYesterdayDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myYesterdayContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안 좋아지겠죠?"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myYesterdayMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var myYesterdayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myYesterdayCommentLabel)
        view.addSubview(myYesterdayCommentHeartButton)
        view.addSubview(myYesterdayCommentMoreButton)
        return view
    }()
    
    private var myYesterdayCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "모두가 당신의 힘든 점들을 모를 거라 생각하겠지만, 누군가는 분명 알고 있을 거에요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myYesterdayCommentHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var myYesterdayCommentMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        [myYesterdayView, myYesterdayCommentView].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myYesterdayView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myYesterdayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myYesterdayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myYesterdayView.widthAnchor.constraint(equalToConstant: 327),
            myYesterdayView.heightAnchor.constraint(equalToConstant: 242),
            
            myYesterdayDateLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 24),
            myYesterdayDateLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            
            myYesterdayContentLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 68),
            myYesterdayContentLabel.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -68),
            myYesterdayContentLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            myYesterdayContentLabel.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -24),
            
            myYesterdayMoreButton.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -24),
            myYesterdayMoreButton.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -30),
            
            myYesterdayCommentView.topAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: 16),
            myYesterdayCommentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myYesterdayCommentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myYesterdayCommentView.widthAnchor.constraint(equalToConstant: 327),
            myYesterdayCommentView.heightAnchor.constraint(equalToConstant: 176),
            
            myYesterdayCommentLabel.topAnchor.constraint(equalTo: myYesterdayCommentView.topAnchor, constant: 24),
            myYesterdayCommentLabel.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -60),
            myYesterdayCommentLabel.leadingAnchor.constraint(equalTo: myYesterdayCommentView.leadingAnchor, constant: 24),
            myYesterdayCommentLabel.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -24),
            
            myYesterdayCommentHeartButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentHeartButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -70),
            myYesterdayCommentHeartButton.widthAnchor.constraint(equalToConstant: 20),
            myYesterdayCommentHeartButton.heightAnchor.constraint(equalToConstant: 20),
            
            myYesterdayCommentMoreButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentMoreButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -30)
        ])
    }
}
