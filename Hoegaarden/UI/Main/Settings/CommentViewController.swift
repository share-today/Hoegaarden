//
//  CommentViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit
import AVFoundation

class CommentViewController: GestureViewController {
    
    private let alert = SweetAlert()
    private let toast = Toast()
    
    private let mainLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.commentLabel
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var commentView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputContent)
        view.addSubview(contentCountLabel)
        view.addSubview(sendStackView)
        return view
    }()
    
    private lazy var inputContent: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = HomeMain.commentTextViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Typography.body2.font
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private var contentCountLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.commentCount
        label.textColor = .black
        label.font = Typography.preText.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let sendLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.commentSend
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = Typography.boldSmall.font
        return label
    }()
    
    private let sendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setGradientLayer()
        setupAddTarget()
        configureNavigationBarButton()
        setConstraints()
        completion(isOn: false)
        
        addTapToDismissKeyboardGesture()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(mainLabel)
        view.addSubview(separatorView)
        view.addSubview(commentView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1).cgColor,
                        UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = commentView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        commentView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setupAddTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            
            separatorView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12),
            separatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            separatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            commentView.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 16),
            commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            commentView.heightAnchor.constraint(equalToConstant: 327),
            
            inputContent.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
            inputContent.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -68),
            inputContent.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            inputContent.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24),
            
            contentCountLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            contentCountLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            
            sendStackView.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            sendStackView.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -25)
        ])
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
        contentCountLabel.text = "\(characterCount)/100"
    }
    
    @objc private func sendButtonClicked() {
        alert.showAlert("",
                        subTitle: AlertMessage.commentMessage,
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.sendButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false)
                toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                message: ToastMessage.sendCommentToast)
            }
        }
    }
    
    @objc private func showPrevious() {
        dismiss(animated: false)
    }
}


extension CommentViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == HomeMain.commentTextViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = HomeMain.commentTextViewPlaceHolder
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
        } else {
            completion(isOn: false)
        }
        
        updateCountLabel(characterCount: characterCount)
        
        return true
    }
}
