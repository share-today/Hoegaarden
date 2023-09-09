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
    
    private let diaryView: DiaryView = DiaryView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        contentView.addSubview(diaryView)
    }
    
    private func setViews() {
        let likeClicked = ClosureButton()
        let moreClicked = ClosureButton()
        
        likeClicked.onClick = {
            print("like")
        }
        
        moreClicked.onClick = {
            print("more")
        }
        
        let diaryState = DiaryState(id: "1",
                                    dateLabel: "",
                                    contentLabel: "아아아아아아",
                                    likeButtonState: LikeButtonState(isLike: true, isEnabled: true),
                                    backgroundColor: .lightGrayGradientWithStroke)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: likeClicked,
            onClickMore: moreClicked,
            contentView: {
                
            }
        )
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            diaryView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            diaryView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            diaryView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            diaryView.heightAnchor.constraint(lessThanOrEqualToConstant: 150)
        ])
    }
    
    @objc private func commentLikeButtonStateTapped() {
//        if commentHeartButton.isSelected == true {
//            commentHeartButton.isSelected = false
//            commentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
//        } else {
//            commentHeartButton.isSelected = true
//            commentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
//            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
//                            message: ToastMessage.heartToast)
//        }
    }
    
    @objc private func commentMoreButtonTapped() {
        commentMoreButtonAction?()
    }
}
