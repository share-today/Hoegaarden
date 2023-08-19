//
//  MyTodayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit
import AVFoundation
import Alamofire

class MyTodayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let toastWithButton = ToastWithButton()
    private var isCountLabelUpdated = true
    private let diaryID = 32
    
    private lazy var myTodayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(todayDateLabel)
        view.addSubview(inputContent)
        view.addSubview(contentCountLabel)
        view.addSubview(sendStackView)
        view.addSubview(fillContentWillLabel)
        view.addSubview(fillContentWillMoreButton)
        return view
    }()
    
    private let todayDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var inputContent: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = HomeMain.textViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Font.air.of(size: 16)
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private let contentCountLabel: UILabel = {
        let label = UILabel()
        label.text = MyToday.contentCount
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: MyToday.contentCount, attributes: [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sendLabel: UILabel = {
        let label = UILabel()
        label.text = MyToday.contentSend
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = Font.bold.of(size: 14)
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        return button
    }()
    
    private lazy var sendStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sendLabel, sendButton])
        view.spacing = 10
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fillContentWillLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let fillContentWillMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.isHidden = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var modifyAndDeleteAlertAction: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.modifyButton)
        actionSheet.mainButton.addTarget(self, action: #selector(modifyButtonAction), for: .touchUpInside)
        
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        actionSheet.secondButton.addTarget(self, action: #selector(modifyDeleteButtonAction), for: .touchUpInside)
        
        return actionSheet
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setGradientLayer()
        setTapGesture()
        setupAddTarget()
        setConstraints()
        getcurrentDate()
        completion(isOn: false)
        getDiary(id: 32)
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
    
    private func setupAddTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        fillContentWillMoreButton.addTarget(self, action: #selector(fillContentWillMoreButtonAction), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myTodayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myTodayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myTodayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myTodayView.heightAnchor.constraint(equalToConstant: 327),
            
            todayDateLabel.topAnchor.constraint(equalTo: myTodayView.topAnchor, constant: 24),
            todayDateLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            
            
            inputContent.topAnchor.constraint(equalTo: todayDateLabel.topAnchor, constant: 68),
            inputContent.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -68),
            inputContent.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            inputContent.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -24),
            
            contentCountLabel.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            contentCountLabel.leadingAnchor.constraint(equalTo: myTodayView.leadingAnchor, constant: 24),
            
            sendButton.widthAnchor.constraint(equalToConstant: 20),
            sendButton.heightAnchor.constraint(equalToConstant: 20),
            
            sendStackView.bottomAnchor.constraint(equalTo: myTodayView.bottomAnchor, constant: -24),
            sendStackView.trailingAnchor.constraint(equalTo: myTodayView.trailingAnchor, constant: -25),
            
            fillContentWillLabel.topAnchor.constraint(equalTo: todayDateLabel.topAnchor, constant: 68),
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
        formatter.dateFormat = MyToday.todayDate
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
            contentCountLabel.text = "\(characterCount)/\(MyToday.characterCount)"
        } else {
            contentCountLabel.text = "\(characterCount)/\(MyToday.fullCharacterCount)"
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
                                             message: ToastMessage.myTodayAdToast,
                                             buttonTitle: ToastMessage.adButton)
    }
    
    private func getDiary(id: Int) {
        MyTodayLocalDataSource.shared.getMyToday(id: id) { [self] result in
            
            switch result {
            case .success(let diaryContent):
                fillContentWillLabel.text = diaryContent
                
                inputContent.isHidden = true
                contentCountLabel.isHidden = true
                sendLabel.isHidden = true
                sendButton.isHidden = true
                fillContentWillLabel.isHidden = false
                fillContentWillMoreButton.isHidden = false
                
            case .failure(let error):
                print("Get Diary Error: \(error.localizedDescription)")
            }
        }
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.myTodaySendMessage,
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.sendButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                let content = inputContent.text
                MyTodayLocalDataSource.shared.sendMyToday(content: content!) { result in
                    switch result {
                    case .success(let diaryId):
                        print("다이어리 ID:", diaryId)
                        print("다이어리 content:", content as Any)
                    case .failure(let error):
                        print("Diary Error: \(error.localizedDescription)")
                    }
                }

                inputContent.resignFirstResponder()

                inputContent.isHidden = true
                contentCountLabel.isHidden = true
                sendLabel.isHidden = true
                sendButton.isHidden = true
                fillContentWillLabel.isHidden = false
                fillContentWillMoreButton.isHidden = false

                fillContentWillLabel.text = self.inputContent.text

                toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                message: ToastMessage.sendToast)
            }
        }
    }
    
    @objc private func modifyButtonAction() {
        alert.showAlert("",
                        subTitle: AlertMessage.modifyMessage,
                        style: AlertStyle.customImage(imageFile: "modify"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.modifyButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false)
                inputContent.resignFirstResponder()
                
                inputContent.text = fillContentWillLabel.text
                inputContent.textColor = .black
                
                MyTodayLocalDataSource.shared.modifyMyToday(id: diaryID) { result in
                    switch result {
                    case .success(let diaryId):
                        print("다이어리 ID:", diaryId)
                    case .failure(let error):
                        print("Diary Error: \(error.localizedDescription)")
                    }
                }
                
                inputContent.isHidden = false
                contentCountLabel.isHidden = false
                sendLabel.isHidden = false
                sendButton.isHidden = false
                fillContentWillLabel.isHidden = true
                fillContentWillMoreButton.isHidden = true
            }
        }
    }
    
    @objc private func modifyDeleteButtonAction() {
        alert.showAlert("",
                        subTitle: AlertMessage.myTodayDeleteMessage,
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.deleteButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false)
                
                MyTodayLocalDataSource.shared.deleteMyToday(id: diaryID) { result in
                    switch result {
                    case .success(let diaryId):
                        print("다이어리 ID:", diaryId)
                    case .failure(let error):
                        print("Delete Diary Error: \(error.localizedDescription)")
                    }
                }
    
                inputContent.isHidden = false
                contentCountLabel.isHidden = false
                sendLabel.isHidden = false
                sendButton.isHidden = false
                fillContentWillLabel.isHidden = true
                fillContentWillMoreButton.isHidden = true

                inputContent.text = HomeMain.textViewPlaceHolder
                inputContent.textColor = .lightGray
                contentCountLabel.text = MyToday.contentCount
                completion(isOn: false)
                
                toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                message: ToastMessage.trashToast)
            }
        }
    }
    
    @objc private func fillContentWillMoreButtonAction() {
        modifyAndDeleteAlertAction.modalPresentationStyle = .overFullScreen
        self.present(modifyAndDeleteAlertAction, animated: false)
    }
}


extension MyTodayViewController: UITextViewDelegate {

    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == HomeMain.textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }

    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = HomeMain.textViewPlaceHolder
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
            guard characterCount <= 100 else { return false }
        } else {
            guard characterCount <= 500 else { return false }
        }
        
        if characterCount > 9 {
            completion(isOn: true)
            
            if isCountLabelUpdated && characterCount == 90 {
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
        alert.showAlert("",
                        subTitle: AlertMessage.myTodayAdMessage,
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.adButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                isCountLabelUpdated = false
                updateCountLabel(characterCount: inputContent.text.count)
            }
        }
    }
}

