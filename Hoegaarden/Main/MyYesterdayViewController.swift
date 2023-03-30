//
//  MyYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit

class MyYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let deleteAlertAction = DeleteAlertAction()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    
    private lazy var myYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(myYesterdayDateLabel)
        view.addSubview(myYesterdayContentLabel)
        view.addSubview(myYesterdayMoreButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var myYesterdayDateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myYesterdayContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안 좋아지겠죠?"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var myYesterdayMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 450)
//        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(myYesterdayCommentView)
        scrollView.addSubview(myYesterdayCommentView2)
        scrollView.addSubview(myYesterdayCommentView3)
        return scrollView
    }()
    
    private lazy var myYesterdayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myYesterdayCommentLabel)
        view.addSubview(myYesterdayCommentHeartButton)
        view.addSubview(myYesterdayCommentMoreButton)
        return view
    }()
    
    private lazy var myYesterdayCommentView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var myYesterdayCommentView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var myYesterdayCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "모두가 당신의 힘든 점들을 모를 거라 생각하겠지만, 누군가는 분명 알고 있을 거에요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var myYesterdayCommentHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var myYesterdayCommentMoreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setGradientLayer()
        setConstraints()
        setupAddTarget()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(myYesterdayView)
        view.addSubview(scrollView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = myYesterdayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myYesterdayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myYesterdayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myYesterdayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myYesterdayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myYesterdayView.widthAnchor.constraint(equalToConstant: 327),
            myYesterdayView.heightAnchor.constraint(equalToConstant: 242),
            
            myYesterdayDateLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 24),
            myYesterdayDateLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            
            myYesterdayContentLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 68),
            myYesterdayContentLabel.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -68),
            myYesterdayContentLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            myYesterdayContentLabel.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -24),
            
            myYesterdayMoreButton.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -24),
            myYesterdayMoreButton.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -30),
            
            scrollView.topAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            myYesterdayCommentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myYesterdayCommentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            myYesterdayCommentView.trailingAnchor.constraint(equalTo: myYesterdayCommentView2.leadingAnchor, constant: -8),
            myYesterdayCommentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myYesterdayCommentView.heightAnchor.constraint(equalToConstant: 176),
            
            myYesterdayCommentView2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myYesterdayCommentView2.leadingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: 8),
            myYesterdayCommentView2.trailingAnchor.constraint(equalTo: myYesterdayCommentView3.leadingAnchor, constant: -8),
            myYesterdayCommentView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myYesterdayCommentView2.heightAnchor.constraint(equalToConstant: 176),
            
            myYesterdayCommentView3.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myYesterdayCommentView3.leadingAnchor.constraint(equalTo: myYesterdayCommentView2.trailingAnchor, constant: 8),
            myYesterdayCommentView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            myYesterdayCommentView3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myYesterdayCommentView3.heightAnchor.constraint(equalToConstant: 176),
            
            myYesterdayCommentLabel.topAnchor.constraint(equalTo: myYesterdayCommentView.topAnchor, constant: 24),
            myYesterdayCommentLabel.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -60),
            myYesterdayCommentLabel.leadingAnchor.constraint(equalTo: myYesterdayCommentView.leadingAnchor, constant: 24),
            myYesterdayCommentLabel.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -24),
            
            myYesterdayCommentHeartButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentHeartButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -70),
            myYesterdayCommentHeartButton.widthAnchor.constraint(equalToConstant: 20),
            myYesterdayCommentHeartButton.heightAnchor.constraint(equalToConstant: 20),
            
            myYesterdayCommentMoreButton.bottomAnchor.constraint(equalTo: myYesterdayCommentView.bottomAnchor, constant: -24),
            myYesterdayCommentMoreButton.trailingAnchor.constraint(equalTo: myYesterdayCommentView.trailingAnchor, constant: -30)
        ])
    }
    
    private func setupAddTarget() {
        myYesterdayMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        deleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        myYesterdayCommentHeartButton.addTarget(self, action: #selector(commentHeartButtonTapped), for: .touchUpInside)
        myYesterdayCommentMoreButton.addTarget(self, action: #selector(commmetMoreButtonTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(commentReportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(commentDeleteTapped), for: .touchUpInside)
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = "어제는 이야기를 들려주지 않았어요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func moreButtonTapped() {
        let actionsheetVC = deleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func deleteTapped() {
        alert.showAlert("", subTitle: "이야기를 지우고 싶은가요?\n삭제하면 복구가 어려워요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false, completion: nil)
                
                self.myYesterdayCommentView.isHidden = true
                
                NSLayoutConstraint.activate([
                    self.myYesterdayCommentView2.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
                    self.myYesterdayCommentView2.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor, constant: 24),
                    self.myYesterdayCommentView2.trailingAnchor.constraint(equalTo: self.myYesterdayCommentView3.leadingAnchor, constant: -8),
                    self.myYesterdayCommentView2.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -50),
                    self.myYesterdayCommentView2.heightAnchor.constraint(equalToConstant: 176),
                    
                    self.myYesterdayCommentView3.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
                    self.myYesterdayCommentView3.leadingAnchor.constraint(equalTo: self.myYesterdayCommentView2.trailingAnchor, constant: 8),
                    self.myYesterdayCommentView3.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor, constant: -24),
                    self.myYesterdayCommentView3.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, constant: -50),
                    self.myYesterdayCommentView3.heightAnchor.constraint(equalToConstant: 176)
                ])
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }
    }
    
    @objc private func commentHeartButtonTapped() {
        if myYesterdayCommentHeartButton.isSelected == true {
            myYesterdayCommentHeartButton.isSelected = false
            myYesterdayCommentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            myYesterdayCommentHeartButton.isSelected = true
            myYesterdayCommentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: ToastMessage.heartToast)
        }
    }
    
    @objc private func commmetMoreButtonTapped() {
        let actionsheetVC = reportAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func commentReportTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기로 불쾌했나요?\n게시물을 즉시 삭제하고, 검토를 통해\n해당 사용자를 제재할게요.",
                        style: AlertStyle.customImage(imageFile: "frown"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "신고하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                     message: ToastMessage.reportToast)
            }
        }
    }
    
    @objc private func commentDeleteTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { self.dismiss(animated: false, completion: nil) }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }
    }
}
