//
//  Some.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/27.
//

import UIKit

class Some: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let toastWithButton = ToastWithButton()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    var isCountLabelUpdated = true
    let textViewPlaceHolder = "누군가에게 털어놓고 싶은 일이\n있었나요?"
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: CGRect(x: 20, y: 150, width: view.frame.width, height: 450))
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .lightGray
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 450)
        scrollView.isPagingEnabled = true
//        scrollView.clipsToBounds = true
//        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 24)
//        scrollView.isOpaque = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var someoneYesterdayView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 450))
        view.backgroundColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someoneYesterdayDateLabel)
        view.addSubview(someoneYesterdayContentLabel)
        view.addSubview(someoneYesterdayHeartButton)
        view.addSubview(someoneYesterdayMoreButton)
        view.addSubview(someoneYesterdayCommentView)
        view.addSubview(someoneYesterdayInputContent)
        view.addSubview(someoneYesterdayContentCountLabel)
        view.addSubview(someoneYesterdaySendLabel)
        view.addSubview(someoneYesterdaySendButton)
        view.addSubview(fillContentWillCommentLabel)
        view.addSubview(fillContentWillCommentMoreButton)
        return view
    }()
    
    lazy var someoneYesterdayView2: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 450))
        view.backgroundColor = .green
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someoneYesterdayDateLabel)
        view.addSubview(someoneYesterdayContentLabel)
        view.addSubview(someoneYesterdayHeartButton)
        view.addSubview(someoneYesterdayMoreButton)
        view.addSubview(someoneYesterdayCommentView)
        view.addSubview(someoneYesterdayInputContent)
        view.addSubview(someoneYesterdayContentCountLabel)
        view.addSubview(someoneYesterdaySendLabel)
        view.addSubview(someoneYesterdaySendButton)
        view.addSubview(fillContentWillCommentLabel)
        view.addSubview(fillContentWillCommentMoreButton)
        return view
    }()
    
    lazy var someoneYesterdayView3: UIView = {
        let view = UIView(frame: CGRect(x: view.frame.width * 2, y: 0, width: view.frame.width, height: 450))
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
//        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someoneYesterdayDateLabel)
        view.addSubview(someoneYesterdayContentLabel)
        view.addSubview(someoneYesterdayHeartButton)
        view.addSubview(someoneYesterdayMoreButton)
        view.addSubview(someoneYesterdayCommentView)
        view.addSubview(someoneYesterdayInputContent)
        view.addSubview(someoneYesterdayContentCountLabel)
        view.addSubview(someoneYesterdaySendLabel)
        view.addSubview(someoneYesterdaySendButton)
        view.addSubview(fillContentWillCommentLabel)
        view.addSubview(fillContentWillCommentMoreButton)
        return view
    }()
    
    private lazy var someoneYesterdayDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var someoneYesterdayContentLabel: UILabel = {
        let label = UILabel()
        label.text = "하고 싶은 일이 있는데 뜻대로 되지 않아요. 친구들은 그저 제 배경만 보고 부러워 하지만 그 안에서의 저는 죽을 맛입니다."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var someoneYesterdayHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var someoneYesterdayMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var someoneYesterdayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var someoneYesterdayInputContent: UITextView = {
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
    
    lazy var someoneYesterdayContentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: "0/50", attributes:
                                                            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var someoneYesterdaySendLabel: UILabel = {
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
    
    lazy var fillContentWillCommentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var fillContentWillCommentMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setTapGesture()
        setConstraints()
        completion(isOn: false)
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(someoneYesterdayView)
        scrollView.addSubview(someoneYesterdayView2)
        scrollView.addSubview(someoneYesterdayView3)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            someoneYesterdayView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            someoneYesterdayView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
//            someoneYesterdayView.widthAnchor.constraint(equalToConstant: 327),
//            someoneYesterdayView.heightAnchor.constraint(equalToConstant: 450),

            someoneYesterdayView2.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            someoneYesterdayView2.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            someoneYesterdayView2.widthAnchor.constraint(equalToConstant: 327),
//            someoneYesterdayView2.heightAnchor.constraint(equalToConstant: 450),

            someoneYesterdayView3.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            someoneYesterdayView3.leadingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            someoneYesterdayView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
//            someoneYesterdayView3.widthAnchor.constraint(equalToConstant: 327),
//            someoneYesterdayView3.heightAnchor.constraint(equalToConstant: 450),
            
            someoneYesterdayDateLabel.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 24),
            someoneYesterdayDateLabel.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 24),

            someoneYesterdayContentLabel.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 68),
            someoneYesterdayContentLabel.bottomAnchor.constraint(equalTo: someoneYesterdayView.bottomAnchor, constant: -260),
            someoneYesterdayContentLabel.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 24),
            someoneYesterdayContentLabel.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -24),

            someoneYesterdayHeartButton.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 180),
            someoneYesterdayHeartButton.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -70),

            someoneYesterdayMoreButton.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 180),
            someoneYesterdayMoreButton.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -30),

            someoneYesterdayCommentView.topAnchor.constraint(equalTo: someoneYesterdayView.topAnchor, constant: 230),
            someoneYesterdayCommentView.bottomAnchor.constraint(equalTo: someoneYesterdayView.bottomAnchor, constant: -24),
            someoneYesterdayCommentView.leadingAnchor.constraint(equalTo: someoneYesterdayView.leadingAnchor, constant: 16),
            someoneYesterdayCommentView.trailingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: -16),
            someoneYesterdayCommentView.widthAnchor.constraint(equalToConstant: 295),
            someoneYesterdayCommentView.heightAnchor.constraint(equalToConstant: 200),

            someoneYesterdayInputContent.topAnchor.constraint(equalTo: someoneYesterdayCommentView.topAnchor, constant: 24),
            someoneYesterdayInputContent.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -60),
            someoneYesterdayInputContent.leadingAnchor.constraint(equalTo: someoneYesterdayCommentView.leadingAnchor, constant: 24),
            someoneYesterdayInputContent.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -24),

            someoneYesterdayContentCountLabel.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdayContentCountLabel.leadingAnchor.constraint(equalTo: someoneYesterdayCommentView.leadingAnchor, constant: 24),

            someoneYesterdaySendLabel.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdaySendLabel.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -50),

            someoneYesterdaySendButton.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
            someoneYesterdaySendButton.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -25),

            fillContentWillCommentLabel.topAnchor.constraint(equalTo: someoneYesterdayCommentView.topAnchor, constant: 24),
            fillContentWillCommentLabel.leadingAnchor.constraint(equalTo: someoneYesterdayCommentView.leadingAnchor, constant: 24),
            fillContentWillCommentLabel.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -24),
            fillContentWillCommentLabel.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -60),

            fillContentWillCommentMoreButton.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -30),
            fillContentWillCommentMoreButton.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24),
        ])
    }
    
    func updateCountLabel(characterCount: Int) {
        if isCountLabelUpdated {
            someoneYesterdayContentCountLabel.text = "\(characterCount)/50"
        } else {
            someoneYesterdayContentCountLabel.text = "\(characterCount)/300"
        }
    }
    
    private func completion(isOn: Bool) {
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
                                             message: "최대 300자를 작성해보세요.",
                                             buttonTitle: "광고 보기")
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
}


extension Some: UITextViewDelegate {
    
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
        guard characterCount <= 50 else { return false }
        
        if characterCount >= 1 {
            completion(isOn: true)
            
            if characterCount == 40 {
                keyboardTopToastMessage()
            }
        } else {
            completion(isOn: false)
        }
        
        updateCountLabel(characterCount: characterCount)
        return true
    }
}

