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
    
    private let diaryView: DiaryView = DiaryView()
    private var smallDiaryView: DiaryView?
    
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
        smallDiaryView = DiaryView(frame: .zero)
        smallDiaryView?.backgroundColor = .white
        self.addSubview(smallDiaryView!)
    }
    
    private func setViews() {
        let diaryState = DiaryState(id: "1",
                                    dateLabel: "23년 08월 20일",
                                    contentLabel: "하고싶은 일이 있는데 뜻대로 되지 않아요. 친구들은 그저 제 배경만 보고 부러워 하지만 그 안에서의 저는 죽을 맛입니다.",
                                    likeButtonState: LikeButtonState(isLike: false, isEnabled: true),
                                    backgroundColor: .pinkGradient)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: {
                print("like")
            },
            onClickMore: {
                print("more")
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
            diaryView.heightAnchor.constraint(greaterThanOrEqualToConstant: 450),
            
            smallDiaryView!.leadingAnchor.constraint(equalTo: diaryView.leadingAnchor, constant: 16),
            smallDiaryView!.trailingAnchor.constraint(equalTo: diaryView.trailingAnchor, constant: -16),
            smallDiaryView!.bottomAnchor.constraint(equalTo: diaryView.bottomAnchor, constant: -24),
            smallDiaryView!.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    @objc private func likeButtonAction() {
//        if heartButton.isSelected == true {
//            heartButton.isSelected = false
//            heartButton.setImage(UIImage(named: "heart"), for: .normal)
//        } else {
//            heartButton.isSelected = true
//            heartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
//            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
//                            message: ToastMessage.heartToast)
//        }
    }
    
    @objc private func showMoreInfo() {
        moreButtonAction?()
    }
    
    @objc private func showCommentMoreInfo() {
        commentMoreButtonAction?()
    }
}
