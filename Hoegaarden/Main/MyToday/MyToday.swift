//
//  MyToday.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/02.
//

import UIKit
import AVFoundation

class MyToday: UIView {
    
    private let toast = Toast()
    private let toastWithButton = ToastWithButton()
    var isCountLabelUpdated = true
    let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"

    lazy var myTodayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todayDateLabel)
        view.addSubview(inputContent)
        view.addSubview(contentCountLabel)
        view.addSubview(sendLabel)
        view.addSubview(sendButton)
        view.addSubview(fillContentWillLabel)
        view.addSubview(fillContentWillMoreButton)
        return view
    }()
    
    private lazy var todayDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var inputContent: UITextView = {
        var textView = UITextView()
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
    
    lazy var contentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/100"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: "0/100", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sendLabel: UILabel = {
        let label = UILabel()
        label.text = "보내기"
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = Font.bold.of(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var sendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var fillContentWillLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fillContentWillMoreButton: UIButton = {
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
        setGradientLayer()
        setTapGesture()
        setConstraints()
        getcurrentDate()
        completion(isOn: false)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        [myTodayView].forEach { addSubview($0) }
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = myTodayView.bounds
        layer.bounds = bounds.insetBy(dx: -0.5 * bounds.size.width, dy: -0.5 * bounds.size.height)
        layer.position = center
        myTodayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myTodayView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            myTodayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            myTodayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            myTodayView.widthAnchor.constraint(equalToConstant: 327),
            myTodayView.heightAnchor.constraint(equalToConstant: 327),
            
            todayDateLabel.topAnchor.constraint(equalTo: myTodayView.topAnchor, constant: 24),
            todayDateLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            
            inputContent.topAnchor.constraint(equalTo: todayDateLabel.topAnchor, constant: 68),
            inputContent.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -68),
            inputContent.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            inputContent.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -24),
            
            contentCountLabel.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            contentCountLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            
            sendLabel.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            sendLabel.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -50),
            
            sendButton.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            sendButton.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -25),
            sendButton.widthAnchor.constraint(equalToConstant: 20),
            sendButton.heightAnchor.constraint(equalToConstant: 20),
            
            fillContentWillLabel.topAnchor.constraint(equalTo: todayDateLabel.topAnchor, constant: 68),
            fillContentWillLabel.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -68),
            fillContentWillLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            fillContentWillLabel.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -24),
            
            fillContentWillMoreButton.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            fillContentWillMoreButton.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -30)
        ])
    }
    
    // 현재 날짜 가져오기
    private func getcurrentDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yy년 MM월 dd일"
        let str = formatter.string(from: Date())
        todayDateLabel.text = "\(str)"
    }
    
    func updateCountLabel(characterCount: Int) {
        if isCountLabelUpdated {
            contentCountLabel.text = "\(characterCount)/100"
        } else {
            contentCountLabel.text = "\(characterCount)/500"
        }
    }
    
    private func completion(isOn: Bool) {
        switch isOn {
        case true:
            let image = UIImage(named: "arrow-right-circle_black")
            sendButton.isUserInteractionEnabled = true
            sendButton.setImage(image, for: .normal)
            sendLabel.textColor = .black
        case false:
            let image = UIImage(named: "arrow-right-circle")
            sendButton.isUserInteractionEnabled = false
            sendButton.setImage(image, for: .normal)
            sendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
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
                                             message: "최대 500자를 작성해보세요.",
                                             buttonTitle: "광고 보기")
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        endEditing(true)
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
        guard characterCount <= 100 else {
            AudioServicesPlayAlertSound(SystemSoundID(4095))
            return false
        }
        
        if characterCount > 9 {
            completion(isOn: true)
            
            if characterCount == 90 {
                keyboardTopToastMessage()
            }
        } else {
            completion(isOn: false)
        }
        
        updateCountLabel(characterCount: characterCount)
        return true
    }
}
