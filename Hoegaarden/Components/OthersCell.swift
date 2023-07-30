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
    
    private lazy var othersYesterdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = false
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(heartButton)
        view.addSubview(moreButton)
        view.addSubview(commentView)
        return view
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = OthersYesterday.date
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = HomeMain.someoneYesterdayContent
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
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let moreButton: UIButton = {
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
        
        view.addSubview(commentInputContent)
        view.addSubview(commentInputContentCountLabel)
        view.addSubview(commentSendStackView)
        view.addSubview(commentWillContentLabel)
        view.addSubview(commentWillMoreButton)
        return view
    }()

    private let commentInputContent: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = OthersYesterday.textViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Font.air.of(size: 16)
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()

    private let commentInputContentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: OthersYesterday.contentCount,
                                                         attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let commentSendLabel: UILabel = {
        let label = UILabel()
        label.text = OthersYesterday.contentSend
        label.textColor = .lightGray
        label.font = Font.bold.of(size: 14)
        return label
    }()

    private let commentSendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var commentSendStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [commentSendLabel, commentSendButton])
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let commentWillContentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let commentWillMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
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
        commentInputContent.delegate = self
    }
    
    private func addViews() {
        contentView.addSubview(othersYesterdayView)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    private func setAddTarget() {
        heartButton.addTarget(self, action: #selector(heartButtonAction), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(showMoreInfo), for: .touchUpInside)
        commentSendButton.addTarget(self, action: #selector(commentSend), for: .touchUpInside)
        commentWillMoreButton.addTarget(self, action: #selector(moreModifyButtonTapped), for: .touchUpInside)
    }
    
    private func completion(isOn: Bool) {
        switch isOn {
        case true:
            let image = UIImage(named: "arrow-right-circle_black")
            commentSendButton.isUserInteractionEnabled = true
            commentSendButton.setImage(image, for: .normal)
            commentSendLabel.textColor = .black
        case false:
            let image = UIImage(named: "arrow-right-circle")
            commentSendButton.isUserInteractionEnabled = false
            commentSendButton.setImage(image, for: .normal)
            commentSendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        }
    }
    
    private func updateCountLabel(characterCount: Int) {
        if isCountLabelUpdated {
            commentInputContentCountLabel.text = "\(characterCount)/\(OthersYesterday.characterCount)"
        } else {
            commentInputContentCountLabel.text = "\(characterCount)/\(OthersYesterday.fullCharacterCount)"
        }
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
            othersYesterdayView.topAnchor.constraint(equalTo: contentView.topAnchor),
            othersYesterdayView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            othersYesterdayView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            othersYesterdayView.heightAnchor.constraint(equalToConstant: 450),
            
            dateLabel.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 24),

            contentLabel.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 68),
            contentLabel.bottomAnchor.constraint(equalTo: othersYesterdayView.bottomAnchor, constant: -260),
            contentLabel.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -24),
            
            heartButton.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 180),
            heartButton.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -70),

            moreButton.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 180),
            moreButton.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -30),

            commentView.topAnchor.constraint(equalTo: othersYesterdayView.topAnchor, constant: 230),
            commentView.bottomAnchor.constraint(equalTo: othersYesterdayView.bottomAnchor, constant: -24),
            commentView.leadingAnchor.constraint(equalTo: othersYesterdayView.leadingAnchor, constant: 16),
            commentView.trailingAnchor.constraint(equalTo: othersYesterdayView.trailingAnchor, constant: -16),

            commentInputContent.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
            commentInputContent.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -60),
            commentInputContent.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            commentInputContent.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),

            commentInputContentCountLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            commentInputContentCountLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            
            commentSendStackView.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            commentSendStackView.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -25),

            commentWillContentLabel.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
            commentWillContentLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            commentWillContentLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),

            commentWillMoreButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            commentWillMoreButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -30)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = OthersYesterday.emptyState
        label.textColor = .black
        label.font = Font.air.of(size: 16)
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
        label.font = Font.air.of(size: 16)
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
                commentInputContent.isHidden = true
                commentInputContentCountLabel.isHidden = true
                commentSendStackView.isHidden = true
                commentWillContentLabel.isHidden = false
                commentWillMoreButton.isHidden = false

                commentWillContentLabel.text = commentInputContent.text

                toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                message: ToastMessage.sendToast)
            }
        }
    }
}


extension OthersCell {

    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        commentInputContentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        commentInputContentCountLabel.isUserInteractionEnabled = true
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
                updateCountLabel(characterCount: commentInputContent.text.count)
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
