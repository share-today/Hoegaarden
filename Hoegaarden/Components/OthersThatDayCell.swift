//
//  OthersThatDayCell.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/25.
//

import UIKit

class OthersThatDayCell: UICollectionViewCell {
    
    private let toast = Toast()
    private let toastWithButton = ToastWithButton()
    private let alert = SweetAlert()
    
    typealias ButtonActionBlock = (() -> Void)
    var moreButtonAction: ButtonActionBlock?
    var commentMoreButtonAction: ButtonActionBlock?
    
    private lazy var othersThatDayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(heartButton)
        view.addSubview(moreButton)
        view.addSubview(commentView)
        return view
    }()
    
    var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "하고 싶은 일이 있는데 뜻대로 되지 않아\n요. 친구들은 그저 제 배경만 보고 부러워\n하지만 그 안에서의 저는 죽을 맛입니다."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let heartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var commentView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(commentLabel)
        view.addSubview(commentHeartButton)
        view.addSubview(commentMoreButton)
        return view
    }()
    
    private lazy var commentLabel: UILabel = {
        var label = UILabel()
        label.text = "저도 비슷한 상황을 겪어봐서 알아요. 그 누구도 나의 힘듬을 공감해주지 않는.. 화이팅"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentHeartButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "heart.selected")
        button.setImage(image, for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var commentMoreButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setAddTarget()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        contentView.addSubview(othersThatDayView)
    }
    
    private func setAddTarget() {
        heartButton.addTarget(self, action: #selector(heartButtonAction), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
        commentHeartButton.addTarget(self, action: #selector(heartButtonAction), for: .touchUpInside)
        commentMoreButton.addTarget(self, action: #selector(showCommentMoreInfo), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            othersThatDayView.topAnchor.constraint(equalTo: topAnchor),
            othersThatDayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            othersThatDayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            othersThatDayView.heightAnchor.constraint(equalToConstant: 450),
            
            dateLabel.topAnchor.constraint(equalTo: othersThatDayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: othersThatDayView.leadingAnchor, constant: 24),
            
            contentLabel.topAnchor.constraint(equalTo: othersThatDayView.topAnchor, constant: 68),
            contentLabel.bottomAnchor.constraint(equalTo: othersThatDayView.bottomAnchor, constant: -260),
            contentLabel.leadingAnchor.constraint(equalTo: othersThatDayView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: othersThatDayView.trailingAnchor, constant: -24),
            
            heartButton.topAnchor.constraint(equalTo: othersThatDayView.topAnchor, constant: 180),
            heartButton.trailingAnchor.constraint(equalTo: othersThatDayView.trailingAnchor, constant: -70),
            
            moreButton.topAnchor.constraint(equalTo: othersThatDayView.topAnchor, constant: 180),
            moreButton.trailingAnchor.constraint(equalTo: othersThatDayView.trailingAnchor, constant: -30),
            
            commentView.topAnchor.constraint(equalTo: othersThatDayView.topAnchor, constant: 230),
            commentView.bottomAnchor.constraint(equalTo: othersThatDayView.bottomAnchor, constant: -24),
            commentView.leadingAnchor.constraint(equalTo: othersThatDayView.leadingAnchor, constant: 16),
            commentView.trailingAnchor.constraint(equalTo: othersThatDayView.trailingAnchor, constant: -16),
            
            commentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
            commentLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -60),
            commentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            commentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),
            
            commentHeartButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            commentHeartButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -70),
            
            commentMoreButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            commentMoreButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -30)
        ])
    }
    
    @objc private func heartButtonAction() {
        if heartButton.isSelected == true {
            heartButton.isSelected = false
            heartButton.setImage(UIImage(named: "heart"), for: .normal)
        } else {
            heartButton.isSelected = true
            heartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: ToastMessage.heartToast)
        }
    }
    
    @objc private func showMoreInfo() {
        moreButtonAction?()
    }
    
    @objc private func showCommentMoreInfo() {
        commentMoreButtonAction?()
    }
}
