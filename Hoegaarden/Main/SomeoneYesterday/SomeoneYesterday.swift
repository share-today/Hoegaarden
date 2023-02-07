//
//  SomeoneYesterday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit
import AVFoundation

class SomeoneYesterday: UIView {
    
    let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"
    
    private lazy var someoneYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(someoneYesterdayDateLabel)
        view.addSubview(someoneYesterdayContentLabel)
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
        let dateLabel = UILabel()
        dateLabel.text = "00년 00월 00일"
        dateLabel.textColor = .black
        dateLabel.font = UIFont(name: "Cafe24SsurroundAir", size: 12)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    private var someoneYesterdayContentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "하고 싶은 일이 있는데 뜻대로 되지 않아\n요. 친구들은 그저 제 배경만 보고 부러워\n하지만 그 안에서의 저는 죽을 맛입니다."
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        contentLabel.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentLabel
    }()
    
    private var someoneYesterdayMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()
    
    private lazy var someoneYesterdayCommentView: UIView = {
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
        textView.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var someoneYesterdayContentCountLabel: UILabel = {
        let cl = UILabel()
        cl.textColor = .black
        cl.font = UIFont(name: "Cafe24SsurroundAir", size: 12)
        cl.attributedText = NSMutableAttributedString(string: "0/50", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        cl.translatesAutoresizingMaskIntoConstraints = false
        return cl
    }()
    
    private var someoneYesterdaySendLabel: UILabel = {
        let sl = UILabel()
        sl.text = "보내기"
        sl.textColor = .lightGray
        sl.font = UIFont(name: "Cafe24Ssurround", size: 14)
        sl.translatesAutoresizingMaskIntoConstraints = false
        return sl
    }()
    
    private var someoneYesterdaySendButton: UIButton = {
        let sb = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        sb.setImage(image, for: .normal)
        sb.translatesAutoresizingMaskIntoConstraints = false
        return sb
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
        [someoneYesterdayView].forEach { addSubview($0) }
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
        someoneYesterdayContentCountLabel.text = "\(characterCount)/100"
    }
}


extension SomeoneYesterday: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .black
            updateCountLabel(characterCount: 0)
        }
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)

        let characterCount = newString.count
        guard characterCount <= 50 else {
            AudioServicesPlayAlertSound(SystemSoundID(4095))
            return false
        }
        updateCountLabel(characterCount: characterCount)
        return true
    }
}
