//
//  MyThatDay.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/09.
//

import UIKit

class MyThatDay: UIViewController {
    
    private let toast = Toast()
    private var alert = SweetAlert()
    private let deleteAlertAction = DeleteAlertAction()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    
    private lazy var myThatDayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1),
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1)]
        layer.locations = [0.5, 1.0]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.addSublayer(layer)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(dateLabel)
        view.addSubview(myThatDayContentLabel)
        view.addSubview(myThatDayMoreButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = "00년 00월 00일"
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myThatDayContentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = "오늘은 상사에게 후배에게 하루종일 시달려서 지쳤어요. 중간에 껴서 새우등 터지고 있는데 어디가서 말해봤자 제 이미지만 안좋아지겠죠?"
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.backgroundColor = .clear
        contentLabel.font = Font.air.of(size: 16)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentLabel
    }()
    
    private var myThatDayMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .clear
        scrollView.contentSize = CGSize(width: view.frame.width * 3, height: 450)
//        scrollView.isPagingEnabled = true
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(myThatDayCommentView)
        scrollView.addSubview(myThatDayCommentView2)
        scrollView.addSubview(myThatDayCommentView3)
        return scrollView
    }()
    
    private lazy var myThatDayCommentView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(myThatDayCommentLabel)
        view.addSubview(myThatDayCommentHeartButton)
        view.addSubview(myThatDayCommentMoreButton)
        return view
    }()
    
    private lazy var myThatDayCommentView2: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var myThatDayCommentView3: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var myThatDayCommentLabel: UILabel = {
        let label = UILabel()
        label.text = "모두가 당신의 힘든 점들을 모를 거라 생각하겠지만, 누군가는 분명 알고 있을 거에요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myThatDayCommentHeartButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var myThatDayCommentMoreButton: UIButton = {
        let button = UIButton(type: .custom)
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
        setupAddTarget()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(myThatDayView)
        view.addSubview(scrollView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.locations = [0, 1]
        layer.frame = myThatDayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myThatDayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setupAddTarget() {
        myThatDayMoreButton.addTarget(self, action: #selector(myThatDayMoreButtonTapped), for: .touchUpInside)
        deleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        myThatDayCommentHeartButton.addTarget(self, action: #selector(myThatDayCommentHeartButtonTapped), for: .touchUpInside)
        myThatDayCommentMoreButton.addTarget(self, action: #selector(myThatDayCommentMoreButtonTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(commentReportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(commentDeleteTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myThatDayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myThatDayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myThatDayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myThatDayView.widthAnchor.constraint(equalToConstant: 327),
            myThatDayView.heightAnchor.constraint(equalToConstant: 242),
            
            dateLabel.topAnchor.constraint(equalTo: myThatDayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: myThatDayView.leadingAnchor, constant: 24),
            
            myThatDayContentLabel.topAnchor.constraint(equalTo: myThatDayView.topAnchor, constant: 68),
            myThatDayContentLabel.bottomAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: -68),
            myThatDayContentLabel.leadingAnchor.constraint(equalTo: myThatDayView.leadingAnchor, constant: 24),
            myThatDayContentLabel.trailingAnchor.constraint(equalTo: myThatDayView.trailingAnchor, constant: -24),
            
            myThatDayMoreButton.bottomAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: -24),
            myThatDayMoreButton.trailingAnchor.constraint(equalTo: myThatDayView.trailingAnchor, constant: -30),
            
            scrollView.topAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: 16),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            myThatDayCommentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myThatDayCommentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
            myThatDayCommentView.trailingAnchor.constraint(equalTo: myThatDayCommentView2.leadingAnchor, constant: -8),
            myThatDayCommentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myThatDayCommentView.heightAnchor.constraint(equalToConstant: 176),
            
            myThatDayCommentView2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myThatDayCommentView2.leadingAnchor.constraint(equalTo: myThatDayCommentView.trailingAnchor, constant: 8),
            myThatDayCommentView2.trailingAnchor.constraint(equalTo: myThatDayCommentView3.leadingAnchor, constant: -8),
            myThatDayCommentView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myThatDayCommentView2.heightAnchor.constraint(equalToConstant: 176),
            
            myThatDayCommentView3.topAnchor.constraint(equalTo: scrollView.topAnchor),
            myThatDayCommentView3.leadingAnchor.constraint(equalTo: myThatDayCommentView2.trailingAnchor, constant: 8),
            myThatDayCommentView3.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
            myThatDayCommentView3.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -50),
            myThatDayCommentView3.heightAnchor.constraint(equalToConstant: 176),
            
            myThatDayCommentLabel.topAnchor.constraint(equalTo: myThatDayCommentView.topAnchor, constant: 24),
            myThatDayCommentLabel.bottomAnchor.constraint(equalTo: myThatDayCommentView.bottomAnchor, constant: -60),
            myThatDayCommentLabel.leadingAnchor.constraint(equalTo: myThatDayCommentView.leadingAnchor, constant: 24),
            myThatDayCommentLabel.trailingAnchor.constraint(equalTo: myThatDayCommentView.trailingAnchor, constant: -24),
            
            myThatDayCommentHeartButton.bottomAnchor.constraint(equalTo: myThatDayCommentView.bottomAnchor, constant: -24),
            myThatDayCommentHeartButton.trailingAnchor.constraint(equalTo: myThatDayCommentView.trailingAnchor, constant: -70),
            myThatDayCommentHeartButton.widthAnchor.constraint(equalToConstant: 20),
            myThatDayCommentHeartButton.heightAnchor.constraint(equalToConstant: 20),
            
            myThatDayCommentMoreButton.bottomAnchor.constraint(equalTo: myThatDayCommentView.bottomAnchor, constant: -24),
            myThatDayCommentMoreButton.trailingAnchor.constraint(equalTo: myThatDayCommentView.trailingAnchor, constant: -30)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = "이날은 이야기를 들려주지 않았어요."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func myThatDayMoreButtonTapped() {
        let actionsheetVC = deleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func deleteTapped() {
        alert.showAlert("", subTitle: "이야기를 지우고 싶은가요?\n삭제하면 복구가 어려워요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false, completion: nil)
                self.emptyStateView()
                
                self.myThatDayView.isHidden = true
                self.myThatDayCommentView.isHidden = true
            
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
    
    @objc private func myThatDayCommentHeartButtonTapped() {
        if myThatDayCommentHeartButton.isSelected == true {
            myThatDayCommentHeartButton.isSelected = false
            myThatDayCommentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            myThatDayCommentHeartButton.isSelected = true
            myThatDayCommentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: "당신의 마음을 전달했습니다.")
        }
    }
    
    @objc private func myThatDayCommentMoreButtonTapped() {
        let actionsheetVC = reportAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func commentReportTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기로 불쾌했나요?\n게시물을 즉시 삭제하고, 검토를 통해\n해당 사용자를 제재할게요.",
                        style: AlertStyle.customImage(imageFile: "frown"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "신고하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                     message: "신고가 완료됐습니다.")
            }
        }
    }
    
    @objc private func commentDeleteTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
}
