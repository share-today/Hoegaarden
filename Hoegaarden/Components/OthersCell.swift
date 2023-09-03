//
//  OthersCell.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/07/22.
//

import UIKit

class OthersCell: UICollectionViewCell {
    
    private let toast = Toast()
    private let toastWithButton = ToastWithButton()
    private let alert = SweetAlert()

    private var isCountLabelUpdated = true
    
    typealias ButtonActionBlock = (() -> Void)
    var moreButtonAction: ButtonActionBlock?
    var moreModifyButtonAction: ButtonActionBlock?
    
    private let diaryView: DiaryView = DiaryView()
    private var smallDiaryView: DiaryView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setViews()
        setTapGesture()
        setAddTarget()
        completion(isOn: false)
        setConstraints()
        setupGestureRecognizer()
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
        let likeClicked = ClosureButton()
        let moreClicked = ClosureButton()
        
        likeClicked.onClick = {
            print("like")
        }
        
        moreClicked.onClick = {
            print("more")
        }
        
        let diaryState = DiaryState(id: "1",
                                    dateLabel: "23년 08월 20일",
                                    contentLabel: "하고싶은 일이 있는데 뜻대로 되지 않아요. 친구들은 그저 제 배경만 보고 부러워 하지만 그 안에서의 저는 죽을 맛입니다.",
                                    heartButtonState: HeartButtonState(isLike: false, isEnabled: true),
                                    backgroundColor: .pinkGradient)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: likeClicked,
            onClickMore: moreClicked,
            contentView: {
                
            }
        )
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    private func setAddTarget() {
//        heartButton.addTarget(self, action: #selector(heartButtonAction), for: .touchUpInside)
//        moreButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
//        commentSendButton.addTarget(self, action: #selector(commentSend), for: .touchUpInside)
//        commentWillMoreButton.addTarget(self, action: #selector(moreModifyButtonTapped), for: .touchUpInside)
    }
    
    private func completion(isOn: Bool) {
//        switch isOn {
//        case true:
//            let image = UIImage(named: "arrow-right-circle_black")
//            commentSendButton.isUserInteractionEnabled = true
//            commentSendButton.setImage(image, for: .normal)
//            commentSendLabel.textColor = .black
//        case false:
//            let image = UIImage(named: "arrow-right-circle")
//            commentSendButton.isUserInteractionEnabled = false
//            commentSendButton.setImage(image, for: .normal)
//            commentSendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
//        }
    }
    
    private func updateCountLabel(characterCount: Int) {
//        if isCountLabelUpdated {
//            commentInputContentCountLabel.text = "\(characterCount)/\(OthersYesterday.characterCount)"
//        } else {
//            commentInputContentCountLabel.text = "\(characterCount)/\(OthersYesterday.fullCharacterCount)"
//        }
    }
    
    private func keyboardTopToastMessage() {
        struct Singleton {
            static var hasRun = false
        }

        guard !Singleton.hasRun else { return }
        Singleton.hasRun = true

        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            let keyboardWindow = windowScene.windows.first(where: { $0.isKeyWindow })
            let keyboardView = keyboardWindow?.subviews.first(where: { String(describing: type(of: $0)).contains("InputSetHostView") }) ?? keyboardWindow?.subviews.first
        }
        self.toastWithButton.showButtonToast(image: UIImage(imageLiteralResourceName: "ad"),
                                             message: ToastMessage.adToast,
                                             buttonTitle: ToastMessage.adButton)
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
            
//            othersYesterdayView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            othersYesterdayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            othersYesterdayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
//            othersYesterdayView.heightAnchor.constraint(equalToConstant: 450),
//
//            dateLabel.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 24),
//            dateLabel.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 24),
//
//            contentLabel.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 68),
//            contentLabel.bottomAnchor.constraint(equalTo: othersYesterdayView.bottomAnchor, constant: -260),
//            contentLabel.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 24),
//            contentLabel.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -24),
//
//            heartButton.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 180),
//            heartButton.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -70),
//
//            moreButton.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 180),
//            moreButton.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -30),
//
//            commentView.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 230),
//            commentView.bottomAnchor.constraint(equalTo: othersYesterdayView.bottomAnchor, constant: -24),
//            commentView.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 16),
//            commentView.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -16),
//
//            commentInputContent.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
//            commentInputContent.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -60),
//            commentInputContent.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
//            commentInputContent.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),
//
//            commentInputContentCountLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
//            commentInputContentCountLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
//
//            commentSendStackView.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
//            commentSendStackView.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -25),
//
//            commentWillContentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
//            commentWillContentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
//            commentWillContentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),
//
//            commentWillMoreButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
//            commentWillMoreButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -30)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = OthersYesterday.emptyState
        label.textColor = .black
        label.font = Typography.body2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

    private func emptyStateAllDeletedView() {
        let label = UILabel()
        label.text = OthersYesterday.allDeleteEmptyState
        label.textColor = .black
        label.font = Typography.body2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        endEditing(true)
    }
    
    @objc private func heartButtonAction() {
//        if heartButton.isSelected == true {
//            heartButton.isSelected = false
//            heartButton.setImage(UIImage(named: "heart"), for: .normal)
//
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
    
    @objc private func moreModifyButtonTapped() {
        moreModifyButtonAction?()
    }
    
    @objc private func commentSend() {
        alert.showAlert("",
                        subTitle: AlertMessage.commentSendMessage,
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.sendButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
//                commentInputContent.isHidden = true
//                commentInputContentCountLabel.isHidden = true
//                commentSendStackView.isHidden = true
//                commentWillContentLabel.isHidden = false
//                commentWillMoreButton.isHidden = false
//
//                commentWillContentLabel.text = commentInputContent.text

                toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                message: ToastMessage.sendToast)
            }
        }
    }
}


extension OthersCell {

    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
//        commentInputContentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
//        commentInputContentCountLabel.isUserInteractionEnabled = true
    }

    @objc func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("",
                        subTitle: AlertMessage.othersAdMessage,
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.adButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                isCountLabelUpdated = false
//                updateCountLabel(characterCount: commentInputContent.text.count)
            }
        }
    }
}


extension OthersCell: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == OthersYesterday.textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = OthersYesterday.textViewPlaceHolder
            textView.textColor = .lightGray
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {

        if text == "\n" {
            textView.resignFirstResponder()
        }

        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        if isCountLabelUpdated {
            guard characterCount <= 50 else { return false }
        } else {
            guard characterCount <= 300 else { return false }
        }

        if characterCount >= 1 {
            completion(isOn: true)

            if isCountLabelUpdated && characterCount == 40 {
                keyboardTopToastMessage()
            }
        } else {
            completion(isOn: false)
        }

        updateCountLabel(characterCount: characterCount)
        return true
    }
}
