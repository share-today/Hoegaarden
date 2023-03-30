//
//  SomeoneYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/27.
//

import UIKit

class SomeoneYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let toastWithButton = ToastWithButton()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    private var isCountLabelUpdated = true
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 450)
//        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(someoneYesterdayView)
        scrollView.addSubview(someoneYesterdayView2)
        scrollView.addSubview(someoneYesterdayView3)
        return scrollView
    }()
    
    private lazy var someoneYesterdayView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var someoneYesterdayView2: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var someoneYesterdayView3: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var someoneYesterdayHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var someoneYesterdayMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var someoneYesterdayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var someoneYesterdayInputContent: UITextView = {
        var textView = UITextView()
        textView.backgroundColor = .clear
        textView.text = HomeMain.textViewPlaceHolder
        textView.textColor = .lightGray
        textView.font = Font.air.of(size: 16)
        textView.autocapitalizationType = .none
        textView.autocorrectionType = .no
        textView.spellCheckingType = .no
        textView.delegate = self
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var someoneYesterdayContentCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.attributedText = NSMutableAttributedString(string: "0/50", attributes:
                                                            [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue])
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var someoneYesterdaySendLabel: UILabel = {
        let label = UILabel()
        label.text = "보내기"
        label.textColor = .lightGray
        label.font = Font.bold.of(size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var someoneYesterdaySendButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "arrow-right-circle")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var fillContentWillCommentLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fillContentWillCommentMoreButton: UIButton = {
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
        completion(isOn: false)
        setupGestureRecognizer()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(scrollView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1).cgColor,
                        UIColor(red: 0.996, green: 0.846, blue: 0.846, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = someoneYesterdayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        someoneYesterdayView.layer.insertSublayer(layer, at: 0)
        
        let layer2 = CAGradientLayer()
        layer2.colors = [UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1).cgColor,
                        UIColor(red: 0.996, green: 0.846, blue: 0.846, alpha: 1).cgColor]
        layer2.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer2.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer2.locations = [0, 1]
        layer2.frame = someoneYesterdayView2.bounds
        layer2.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer2.position = view.center
        someoneYesterdayView2.layer.insertSublayer(layer2, at: 0)
        
        let layer3 = CAGradientLayer()
        layer3.colors = [UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1).cgColor,
                        UIColor(red: 0.996, green: 0.846, blue: 0.846, alpha: 1).cgColor]
        layer3.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer3.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer3.locations = [0, 1]
        layer3.frame = someoneYesterdayView3.bounds
        layer3.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer3.position = view.center
        someoneYesterdayView3.layer.insertSublayer(layer3, at: 0)
    }
    
    private func setTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapTextView(_:)))
        view.addGestureRecognizer(tapGesture)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            someoneYesterdayView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            someoneYesterdayView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            someoneYesterdayView.trailingAnchor.constraint(equalTo: someoneYesterdayView2.leadingAnchor, constant: -8),
            someoneYesterdayView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            someoneYesterdayView.heightAnchor.constraint(equalToConstant: 450),

            someoneYesterdayView2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            someoneYesterdayView2.leadingAnchor.constraint(equalTo: someoneYesterdayView.trailingAnchor, constant: 8),
            someoneYesterdayView2.trailingAnchor.constraint(equalTo: someoneYesterdayView3.leadingAnchor, constant: -8),
            someoneYesterdayView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            someoneYesterdayView2.heightAnchor.constraint(equalToConstant: 450),

            someoneYesterdayView3.topAnchor.constraint(equalTo: scrollView.topAnchor),
            someoneYesterdayView3.leadingAnchor.constraint(equalTo: someoneYesterdayView2.trailingAnchor, constant: 8),
            someoneYesterdayView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            someoneYesterdayView3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            someoneYesterdayView3.heightAnchor.constraint(equalToConstant: 450),
            
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

            fillContentWillCommentMoreButton.trailingAnchor.constraint(equalTo: someoneYesterdayCommentView.trailingAnchor, constant: -30),
            fillContentWillCommentMoreButton.bottomAnchor.constraint(equalTo: someoneYesterdayCommentView.bottomAnchor, constant: -24)
        ])
    }
    
    private func setupAddTarget() {
        someoneYesterdayHeartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        someoneYesterdayMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(reportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(someoneDeleteTapped), for: .touchUpInside)
        someoneYesterdaySendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        fillContentWillCommentMoreButton.addTarget(self, action: #selector(fillContentWillCommentMoreButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.modifyButton.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func updateCountLabel(characterCount: Int) {
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
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = "나의 오늘을 공유하면 누군가의\n이야기를 들을 수 있어요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func emptyStateAllDeletedView() {
        let label = UILabel()
        label.text = "모든 이야기를 확인했어요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func didTapTextView(_ sender: Any) {
        view.endEditing(true)
    }
    
    @objc private func heartButtonTapped() {
        if someoneYesterdayHeartButton.isSelected == true {
            someoneYesterdayHeartButton.isSelected = false
            someoneYesterdayHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            someoneYesterdayHeartButton.isSelected = true
            someoneYesterdayHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: ToastMessage.heartToast)
        }
    }
    
    @objc private func moreButtonTapped() {
        let actionsheetVC = reportAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func reportTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기로 불쾌했나요?\n게시물을 즉시 삭제하고, 검토를 통해\n해당 사용자를 제재할게요.",
                        style: AlertStyle.customImage(imageFile: "frown"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                     message: ToastMessage.reportToast)
            }
        }
    }
    
    @objc private func someoneDeleteTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false, completion: nil)
                
                self.someoneYesterdayView.isHidden = true
                self.someoneYesterdayCommentView.isHidden = true
                    
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("", subTitle: "이야기를 누군가에게 보낼까요?\n이야기를 전달받은 누군가의 마음은 따뜻해질 거예요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.someoneYesterdayInputContent.resignFirstResponder()
                
                self.someoneYesterdayInputContent.isHidden = true
                self.someoneYesterdayContentCountLabel.isHidden = true
                self.someoneYesterdaySendLabel.isHidden = true
                self.someoneYesterdaySendButton.isHidden = true
                self.fillContentWillCommentLabel.isHidden = false
                self.fillContentWillCommentMoreButton.isHidden = false
                
                self.fillContentWillCommentLabel.text = self.someoneYesterdayInputContent.text

                self.toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                     message: ToastMessage.sendToast)
            }
        }
    }
    
    @objc private func fillContentWillCommentMoreButtonTapped() {
        let actionsheetVC = modifyAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func modifyButtonTapped() {
        alert.showAlert("", subTitle: "이야기를 수정하겠어요?\n누군가는 이미 수정 전 이야기를\n확인했을 수도 있어요.",
                        style: AlertStyle.customImage(imageFile: "modify"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "수정하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false)
                self.someoneYesterdayInputContent.resignFirstResponder()
                
                self.someoneYesterdayInputContent.isHidden = false
                self.someoneYesterdayContentCountLabel.isHidden = false
                self.someoneYesterdaySendLabel.isHidden = false
                self.someoneYesterdaySendButton.isHidden = false
                self.fillContentWillCommentLabel.isHidden = true
                self.fillContentWillCommentMoreButton.isHidden = true
            }
        }
    }
    
    @objc private func deleteButtonTapped() {
        alert.showAlert("", subTitle: "다른 이야기를 적어보고 싶은가요?\n삭제하면 해당 이야기는 누군가에게\n전해지지 않으며, 복구가 어려워요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false)
    
                self.someoneYesterdayInputContent.isHidden = false
                self.someoneYesterdayContentCountLabel.isHidden = false
                self.someoneYesterdaySendLabel.isHidden = false
                self.someoneYesterdaySendButton.isHidden = false
                self.fillContentWillCommentLabel.isHidden = true
                self.fillContentWillCommentMoreButton.isHidden = true

                self.someoneYesterdayInputContent.text = HomeMain.textViewPlaceHolder
                self.someoneYesterdayInputContent.textColor = .lightGray
                self.someoneYesterdayContentCountLabel.text = "0/50"
                self.completion(isOn: false)
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }
    }
}


extension SomeoneYesterdayViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == HomeMain.textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
//    func textViewDidEndEditing(_ textView: UITextView) {
//        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
//            textView.text = Constants.textViewPlaceHolder
//            textView.textColor = .lightGray
//        }
//    }
    
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


extension SomeoneYesterdayViewController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        someoneYesterdayContentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        someoneYesterdayContentCountLabel.isUserInteractionEnabled = true
    }
    
    @objc func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("", subTitle: "광고를 보면 최대 300자까지 더 많은\n마음속 이야기를 적을 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "광고 보기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                self.isCountLabelUpdated = false
                self.updateCountLabel(characterCount: self.someoneYesterdayInputContent.text.count)
            }
        }
    }
}
