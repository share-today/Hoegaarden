//
//  MyYesterdayCell.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/23.
//

import UIKit

class MyYesterdayCell: UICollectionViewCell {
    
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
        let diaryState = DiaryState(id: "1",
                                    dateLabel: "",
                                    contentLabel: "아아아아아아",
                                    likeButtonState: LikeButtonState(isLike: false, isEnabled: true),
                                    backgroundColor: .lightGrayGradientWithStroke)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: {
                print("like")
            },
            onClickMore: { [self] in
                commentMoreButtonAction?()
            },
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
}
