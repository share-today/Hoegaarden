//
//  MyYesterday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyYesterday: UIView {
    
    private lazy var myYesterdayView: UIView = {
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
        let dateLabel = UILabel()
        dateLabel.text = "00년 00월 00일"
        dateLabel.textColor = .black
        dateLabel.font = Font.air.of(size: 12)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private var myYesterdayContentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "오늘은 상사에게 후배에게 하루종일 시달\n려서 지쳤어요. 중간에 껴서 새우등 터지\n고 있는데 어디가서 말해봤자 제 이미지\n만 안 좋아지겠죠?"
        contentLabel.textColor = .black
        contentLabel.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        contentLabel.font = Font.air.of(size: 16)
        contentLabel.numberOfLines = 0
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentLabel
    }()
    
    lazy var myYesterdayMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()
    
    private lazy var myYesterdayCommentView: UIView = {
        let commentView = UIView()
        commentView.backgroundColor = .white
        commentView.layer.cornerRadius = 8
        commentView.clipsToBounds = true
        commentView.layer.borderWidth = 1
        commentView.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        commentView.translatesAutoresizingMaskIntoConstraints = false
        commentView.addSubview(myYesterdayCommentLabel)
        commentView.addSubview(myYesterdayCommentHeartButton)
        commentView.addSubview(myYesterdayCommentMoreButton)
        return commentView
    }()
    
    private var myYesterdayCommentLabel: UILabel = {
        let commentLabel = UILabel()
        commentLabel.text = "모두가 당신의 힘든 점들을 모를 거라 생각하겠\n지만, 누군가는 분명 알고 있을 거에요."
        commentLabel.textColor = .black
        commentLabel.font = Font.air.of(size: 14)
        commentLabel.backgroundColor = .clear
        commentLabel.numberOfLines = 0
        commentLabel.translatesAutoresizingMaskIntoConstraints = false
        return commentLabel
    }()
    
    lazy var myYesterdayCommentHeartButton: UIButton = {
        let heartButton = UIButton()
        let image = UIImage(named: "heart")
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = .black
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
    }()
    
    lazy var myYesterdayCommentMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
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
    
    func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        [myYesterdayView, myYesterdayCommentView].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myYesterdayView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            myYesterdayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myYesterdayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myYesterdayView.widthAnchor.constraint(equalToConstant: 327),
            myYesterdayView.heightAnchor.constraint(equalToConstant: 242)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayDateLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 24),
            myYesterdayDateLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayContentLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 68),
            myYesterdayContentLabel.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -68),
            myYesterdayContentLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            myYesterdayContentLabel.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayMoreButton.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -24),
            myYesterdayMoreButton.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayCommentView.topAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: 16),
            myYesterdayCommentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myYesterdayCommentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myYesterdayCommentView.widthAnchor.constraint(equalToConstant: 327),
            myYesterdayCommentView.heightAnchor.constraint(equalToConstant: 176)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayCommentLabel.topAnchor.constraint(equalTo: myYesterdayCommentView.topAnchor, constant: 24),
            myYesterdayCommentLabel.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -60),
            myYesterdayCommentLabel.leadingAnchor.constraint(equalTo: myYesterdayCommentView.leadingAnchor, constant: 24),
            myYesterdayCommentLabel.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayCommentHeartButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentHeartButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -70),
            myYesterdayCommentHeartButton.widthAnchor.constraint(equalToConstant: 20),
            myYesterdayCommentHeartButton.heightAnchor.constraint(equalToConstant: 20)
        ])
        
        NSLayoutConstraint.activate([
            myYesterdayCommentMoreButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentMoreButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -30)
        ])
    }
}
