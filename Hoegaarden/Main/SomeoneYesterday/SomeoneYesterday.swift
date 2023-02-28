//
//  SomeoneYesterday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit
import AVFoundation

class SomeoneYesterday: UIView {
    
    private let toast = Toast()
    private let toastWithButton = ToastWithButton()
    let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"
    
    private lazy var someoneYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(someoneYesterdayDateLabel)
        view.addSubview(someoneYesterdayContentLabel)
        view.addSubview(someoneYesterdayHeartButton)
        view.addSubview(someoneYesterdayMoreButton)
        view.addSubview(someoneYesterdayCommentView)
        view.addSubview(someoneYesterdayInputContent)
        view.addSubview(someoneYesterdayContentCountLabel)
        view.addSubview(someoneYesterdaySendLabel)
        view.addSubview(someoneYesterdaySendButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var someoneYesterdayDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var someoneYesterdayContentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "하고 싶은 일이 있는데 뜻대로 되지 않아\n요. 친구들은 그저 제 배경만 보고 부러워\n하지만 그 안에서의 저는 죽을 맛입니다."
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        contentLabel.font = Font.air.of(size: 16)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentLabel
    }()
    
    lazy var someoneYesterdayHeartButton: UIButton = {
        let heartButton = UIButton()
        let image = UIImage(named: "heart")
        heartButton.setImage(image, for: .normal)
        heartButton.tintColor = .black
        heartButton.translatesAutoresizingMaskIntoConstraints = false
        return heartButton
    }()
    
    lazy var someoneYesterdayMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()
    
    private var someoneYesterdayCommentView: UIView = {
       let comView = UIView()
        comView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        comView.layer.cornerRadius = 8
        comView.clipsToBounds = true
        comView.translatesAutoresizingMaskIntoConstraints = false
        return comView
    }()
    
    lazy var someoneYesterdayInputContent: UITextView = {
        var textView = UITextView()
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = 1.27
        textView.backgroundColor = .clear
        textView.text = textViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Font.air.of(size: 16)
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    lazy var someoneYesterdayContentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: "0/50", attributes:
            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var someoneYesterdaySendLabel: UILabel = {
        let label = UILabel()
        label.text = "보내기"
        label.textColor = .lightGray
        label.font = Font.bold.of(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var someoneYesterdaySendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setTapGesture()
        setConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        [someoneYesterdayView].forEach { addSubview($0) }
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            someoneYesterdayView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            someoneYesterdayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            someoneYesterdayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            someoneYesterdayView.widthAnchor.constraint(equalToConstant: 327),
            someoneYesterdayView.heightAnchor.constraint(equalToConstant: 450)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayDateLabel.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 24),
            someoneYesterdayDateLabel.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayContentLabel.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 68),
            someoneYesterdayContentLabel.bottomAnchor.constraint(equalTo: someoneYesterdayView.bottomAnchor, constant: -260),
            someoneYesterdayContentLabel.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 24),
            someoneYesterdayContentLabel.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayHeartButton.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 180),
            someoneYesterdayHeartButton.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -70)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayMoreButton.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 180),
            someoneYesterdayMoreButton.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayCommentView.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 230),
            someoneYesterdayCommentView.bottomAnchor.constraint(equalTo: someoneYesterdayView.bottomAnchor, constant: -24),
            someoneYesterdayCommentView.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 16),
            someoneYesterdayCommentView.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -16),
            someoneYesterdayCommentView.widthAnchor.constraint(equalToConstant: 295),
            someoneYesterdayCommentView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayInputContent.topAnchor.constraint(equalTo: someoneYesterdayCommentView.topAnchor, constant: 24),
            someoneYesterdayInputContent.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -60),
            someoneYesterdayInputContent.leadingAnchor.constraint(equalTo: someoneYesterdayCommentView.leadingAnchor, constant: 24),
            someoneYesterdayInputContent.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdayContentCountLabel.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdayContentCountLabel.leadingAnchor.constraint(equalTo: someoneYesterdayCommentView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            someoneYesterdaySendLabel.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdaySendLabel.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            someoneYesterdaySendButton.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdaySendButton.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -25),
            someoneYesterdaySendButton.widthAnchor.constraint(equalToConstant: 20),
            someoneYesterdaySendButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func updateCountLabel(characterCount: Int) {
        someoneYesterdayContentCountLabel.text = "\(characterCount)/50"
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        endEditing(true)
    }
}


extension SomeoneYesterday: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    private func textViewDidEndEditing(_ textView: UITextView) -> Bool {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
            completion(isOn: false)
        }
        return true
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
        }
        
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        guard characterCount <= 50 else {
            AudioServicesPlayAlertSound(SystemSoundID(4095))
            return false
        }
        
        if characterCount >= 1 {
            completion(isOn: true)
        } else if characterCount == 0 {
            completion(isOn: false)
        }
        
        if characterCount == 40 {
            self.toastWithButton.showButtonToast(image: UIImage(imageLiteralResourceName: "ad"),
                                                 message: "최대 300자를 작성해보세요.",
                                                 buttonTitle: "광고 보기")
        }
        
        updateCountLabel(characterCount: characterCount)
        return true
    }
    
    func completion(isOn: Bool) {
        switch isOn {
        case true:
            let image = UIImage(named: "arrow-right-circle_black")
            someoneYesterdaySendButton.isUserInteractionEnabled = true
            someoneYesterdaySendButton.setImage(image, for: .normal)
            someoneYesterdaySendLabel.textColor = .black
        case false:
            let image = UIImage(named: "arrow-right-circle")
            someoneYesterdaySendButton.isUserInteractionEnabled = false
            someoneYesterdaySendButton.setImage(image, for: .normal)
            someoneYesterdaySendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        }
    }
}
