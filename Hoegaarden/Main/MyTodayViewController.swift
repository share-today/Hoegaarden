//
//  MyTodayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit
import AVFoundation

class MyTodayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let toastWithButton = ToastWithButton()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    private var isCountLabelUpdated = true

    private lazy var myTodayView: UIView = {
        let view = UIView()
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
    
    private lazy var inputContent: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = Constants.textViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Font.air.of(size: 16)
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var contentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/100"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: "0/100", attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendLabel: UILabel = {
        let label = UILabel()
        label.text = "보내기"
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = Font.bold.of(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var fillContentWillLabel: UILabel = {
       let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fillContentWillMoreButton: UIButton = {
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
        setGradientLayer()
        setTapGesture()
        setConstraints()
        setupAddTarget()
        getcurrentDate()
        completion(isOn: false)
        setupGestureRecognizer()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(myTodayView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = myTodayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myTodayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myTodayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myTodayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myTodayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
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
    
    private func setupAddTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        fillContentWillMoreButton.addTarget(self, action: #selector(fillContentWillMoreButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.modifyButton.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    // 현재 날짜 가져오기
    private func getcurrentDate() {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.dateFormat = "yy년 MM월 dd일"
        let str = formatter.string(from: Date())
        todayDateLabel.text = "\(str)"
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
    
    private func updateCountLabel(characterCount: Int) {
        if isCountLabelUpdated {
            contentCountLabel.text = "\(characterCount)/100"
        } else {
            contentCountLabel.text = "\(characterCount)/500"
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
        view.endEditing(true)
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("", subTitle: "나의 오늘을 누군가에게 보낼까요?\n분명 나의 이야기를 잘 들어줄\n누군가에게 도착할 거예요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.inputContent.resignFirstResponder()
                
                self.inputContent.isHidden = true
                self.contentCountLabel.isHidden = true
                self.sendLabel.isHidden = true
                self.sendButton.isHidden = true
                self.fillContentWillLabel.isHidden = false
                self.fillContentWillMoreButton.isHidden = false
                
                self.fillContentWillLabel.text = self.inputContent.text
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                     message: "전송이 완료됐습니다.")
            }
        }
    }
    
    @objc private func fillContentWillMoreButtonTapped() {
        let actionsheetVC = modifyAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func modifyButtonTapped() {
        alert.showAlert("", subTitle: "이야기를 수정하겠어요?\n누군가는 이미 수정 전 이야기를\n확인했을 수도 있어요.",
                        style: AlertStyle.customImage(imageFile: "modify"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "수정하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false)
                self.inputContent.resignFirstResponder()
                
                self.inputContent.isHidden = false
                self.contentCountLabel.isHidden = false
                self.sendLabel.isHidden = false
                self.sendButton.isHidden = false
                self.fillContentWillLabel.isHidden = true
                self.fillContentWillMoreButton.isHidden = true
            }
        }
    }
    
    @objc private func deleteButtonTapped() {
        alert.showAlert("", subTitle: "다른 이야기를 적어보고 싶은가요?\n삭제하면 해당 이야기는 누군가에게\n전해지지 않으며, 복구가 어려워요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false)
    
                self.inputContent.isHidden = false
                self.contentCountLabel.isHidden = false
                self.sendLabel.isHidden = false
                self.sendButton.isHidden = false
                self.fillContentWillLabel.isHidden = true
                self.fillContentWillMoreButton.isHidden = true

                self.inputContent.text = Constants.textViewPlaceHolder
                self.inputContent.textColor = .lightGray
                self.contentCountLabel.text = "0/100"
                self.completion(isOn: false)
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
}


extension MyTodayViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == Constants.textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = Constants.textViewPlaceHolder
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
        
        var characterCount = newString.count
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


extension MyTodayViewController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        contentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        contentCountLabel.isUserInteractionEnabled = true
    }
    
    @objc private func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("", subTitle: "광고를 보면 최대 500자까지 더 많은\n마음속 이야기를 적을 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "광고 보기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                self.isCountLabelUpdated = false
                self.updateCountLabel(characterCount: self.inputContent.text.count)
            }
        }
    }
}
