//
//  MyToday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/02.
//

import UIKit
import AVFoundation

class MyToday: UIView {
    
    let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"
    
    // 나의 오늘 텍스트 필드뷰
    private lazy var myTodayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [
          UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1),
          UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1)
        ]
        layer.locations = [0.5, 1.0]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
//        layer.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
//        layer.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
//        layer.position = view.center
        view.layer.addSublayer(layer)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(todayDateLabel)
        view.addSubview(inputContent)
        view.addSubview(contentCountButton)
        view.addSubview(sendLabel)
        view.addSubview(sendButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var todayDateLabel: UILabel = {
        let dateLabel = UILabel()
        dateLabel.textColor = .black
        dateLabel.font = UIFont(name: "Cafe24SsurroundAir", size: 12)
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        return dateLabel
    }()
    
    lazy var inputContent: UITextView = {
        var textView = UITextView()
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
    
    private var contentCountButton: UIButton = {
        let countButton = UIButton()
        countButton.setTitle("0/100", for: .normal)
        countButton.setTitleColor(.black, for: .normal)
        countButton.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 12)
        countButton.setUnderLine()
        countButton.translatesAutoresizingMaskIntoConstraints = false
        return countButton
    }()
    
    // 보내기 버튼 레이블
    private var sendLabel: UILabel = {
        let sendLabel = UILabel()
        sendLabel.text = "보내기"
        sendLabel.textColor = .lightGray
        sendLabel.font = UIFont(name: "Cafe24Ssurround", size: 14)
        sendLabel.translatesAutoresizingMaskIntoConstraints = false
        return sendLabel
    }()
    
    // 보내기 버튼
    private var sendButton: UIButton = {
        let sendBtn = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        sendBtn.setImage(image, for: .normal)
        sendBtn.tintColor = .lightGray
        sendBtn.translatesAutoresizingMaskIntoConstraints = false
        return sendBtn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
        addViews()
        setConstraints()
        getcurrentDate()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        [myTodayView].forEach { addSubview($0) }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myTodayView.topAnchor.constraint(equalTo: topAnchor, constant: 240),
            myTodayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myTodayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myTodayView.widthAnchor.constraint(equalToConstant: 327),
            myTodayView.heightAnchor.constraint(equalToConstant: 327)
        ])
        
        NSLayoutConstraint.activate([
            todayDateLabel.topAnchor.constraint(equalTo: myTodayView.topAnchor, constant: 24),
            todayDateLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            inputContent.topAnchor.constraint(equalTo: todayDateLabel.topAnchor, constant: 68),
            inputContent.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -68),
            inputContent.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            inputContent.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            contentCountButton.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            contentCountButton.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            sendLabel.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            sendLabel.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            sendButton.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -25),
            sendButton.widthAnchor.constraint(equalToConstant: 20),
            sendButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    // 현재 날짜 가져오기
    func getcurrentDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yy년 MM월 dd일"
        let str = formatter.string(from: Date())
        todayDateLabel.text = "\(str)"
    }
    
    // 글자수 세기
    private func updateCountLabel(characterCount: Int) {
        contentCountButton.setTitle("\(characterCount)/100", for: .normal)
    }
}


extension MyToday: UITextViewDelegate {

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
        guard characterCount <= 100 else {
            AudioServicesPlayAlertSound(SystemSoundID(4095))
            return false
        }
        updateCountLabel(characterCount: characterCount)

        return true
    }
}


extension UIButton {
    func setUnderLine() {
        guard let title = title(for: .normal) else { return }
        let attributedString = NSMutableAttributedString(string: title)
        attributedString.addAttribute(.underlineStyle,
                                       value: NSUnderlineStyle.single.rawValue,
                                       range: NSRange(location: 0, length: title.count)
        )
        setAttributedTitle(attributedString, for: .normal)
    }
}
