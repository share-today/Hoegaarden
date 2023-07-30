//
//  MyYesterdayCell.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/23.
//

import UIKit

class MyYesterdayCell: UICollectionViewCell {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    
    typealias ButtonActionBlock = (() -> Void)
    var commentMoreButtonAction: ButtonActionBlock?
    
    private lazy var MyYesterdayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(commentContent)
        view.addSubview(commentHeartButton)
        view.addSubview(commentMoreButton)
       return view
    }()
    
    var commentContent: UILabel = {
        let label = UILabel()
        label.text = "모두가 당신의 힘든 점들을 모를 거라 생각하겠지만, 누군가는 분명 알고 있을 거에요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let commentHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let commentMoreButton: UIButton = {
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
        contentView.addSubview(MyYesterdayCommentView)
    }
    
    private func setAddTarget() {
        commentHeartButton.addTarget(self, action: #selector(commentHeartButtonTapped), for: .touchUpInside)
        commentMoreButton.addTarget(self, action: #selector(commentMoreButtonTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            MyYesterdayCommentView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            MyYesterdayCommentView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            MyYesterdayCommentView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            MyYesterdayCommentView.heightAnchor.constraint(equalToConstant: 132),
            
            commentContent.topAnchor.constraint(equalTo: MyYesterdayCommentView.topAnchor, constant: 24),
            commentContent.leadingAnchor.constraint(equalTo: MyYesterdayCommentView.leadingAnchor, constant: 24),
            commentContent.trailingAnchor.constraint(equalTo: MyYesterdayCommentView.trailingAnchor, constant: -24),
            
            commentHeartButton.bottomAnchor.constraint(equalTo: MyYesterdayCommentView.bottomAnchor, constant: -24),
            commentHeartButton.trailingAnchor.constraint(equalTo: MyYesterdayCommentView.trailingAnchor, constant: -70),
            
            commentMoreButton.bottomAnchor.constraint(equalTo: MyYesterdayCommentView.bottomAnchor, constant: -24),
            commentMoreButton.trailingAnchor.constraint(equalTo: MyYesterdayCommentView.trailingAnchor, constant: -25)
        ])
    }
    
    @objc private func commentHeartButtonTapped() {
        if commentHeartButton.isSelected == true {
            commentHeartButton.isSelected = false
            commentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
        } else {
            commentHeartButton.isSelected = true
            commentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: ToastMessage.heartToast)
        }
    }
    
    @objc private func commentMoreButtonTapped() {
        commentMoreButtonAction?()
    }
}
