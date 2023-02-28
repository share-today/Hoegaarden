//
//  CommentView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit
import AVFoundation

class CommentView: UIViewController {
    
    var alert = SweetAlert()
    private let toast = Toast()
    let textViewPlaceHolder = "앱의 발전을 위해 좋은 의견 많이 부탁드\n려요. :)"
    
    private var commentLabel: UILabel = {
        let label = UILabel()
        label.text = "의견 보내기"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var commentView: UIView = {
        let view = UIView()
        let layer0 = CAGradientLayer()
        layer0.colors = [
            UIColor(red: 0.958, green: 0.958, blue: 0.958, alpha: 1).cgColor,
            UIColor(red: 0.92, green: 0.92, blue: 0.92, alpha: 1).cgColor]
        layer0.locations = [0, 1]
        layer0.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer0.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer0.transform = CATransform3DMakeAffineTransform(CGAffineTransform(a: 0, b: 1, c: -1, d: 0, tx: 1, ty: 0))
        layer0.bounds = view.bounds.insetBy(dx: -0.5*view.bounds.size.width, dy: -0.5*view.bounds.size.height)
        layer0.position = view.center
        view.layer.addSublayer(layer0)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(inputContent)
        view.addSubview(contentCountLabel)
        view.addSubview(sendLabel)
        view.addSubview(sendButton)
        return view
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
    
    private var contentCountLabel: UILabel = {
        let label = UILabel()
        label.text = "0/100"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var sendLabel: UILabel = {
        let label = UILabel()
        label.text = "보내기"
        label.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        label.font = Font.bold.of(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var sendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.tintColor = .lightGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func updateCountLabel(characterCount: Int) {
        contentCountLabel.text = "\(characterCount)/100"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setupAddTarget()
        configureNavigationBarButton()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        view.addSubview(commentLabel)
        view.addSubview(lineView)
        view.addSubview(commentView)
    }
    
    func setupAddTarget() {
        sendButton.addTarget(self, action: #selector(sendButtonClicked), for: .touchUpInside)
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            commentLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            commentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            commentView.topAnchor.constraint(equalTo: view.topAnchor, constant: 210),
            commentView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            commentView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            commentView.widthAnchor.constraint(equalToConstant: 327),
            commentView.heightAnchor.constraint(equalToConstant: 327)
        ])

        NSLayoutConstraint.activate([
            inputContent.topAnchor.constraint(equalTo: commentView.topAnchor, constant: 24),
            inputContent.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -68),
            inputContent.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24),
            inputContent.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -24)
        ])

        NSLayoutConstraint.activate([
            contentCountLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            contentCountLabel.leadingAnchor.constraint(equalTo: commentView.leadingAnchor, constant: 24)
        ])

        NSLayoutConstraint.activate([
            sendLabel.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            sendLabel.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -50)
        ])

        NSLayoutConstraint.activate([
            sendButton.bottomAnchor.constraint(equalTo: commentView.bottomAnchor, constant: -24),
            sendButton.trailingAnchor.constraint(equalTo: commentView.trailingAnchor, constant: -25),
            sendButton.widthAnchor.constraint(equalToConstant: 20),
            sendButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    @objc func showPrevious() {
        let controller = SettingController()
        controller.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: false, completion: nil)
    }
    
    @objc func sendButtonClicked() {
        alert.showAlert("", subTitle: "의견을 보낼까요?\n주신 의견들은 꼼꼼히 읽어볼게요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { } else {
                let controller = SettingController()
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: false)
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                     message: "의견이 접수됐습니다.")
            }
        }
    }
}


extension CommentView: UITextViewDelegate {
    
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
    
    func completion(isOn: Bool) {
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
}
