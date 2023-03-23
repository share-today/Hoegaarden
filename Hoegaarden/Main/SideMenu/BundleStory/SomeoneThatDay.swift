//
//  SomeoneThatDay.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/09.
//

import UIKit

class SomeoneThatDay: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let deleteAlertAction = DeleteAlertAction()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    
    private lazy var someoneThatDayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(dateLabel)
        view.addSubview(someoneThatDayContentLabel)
        view.addSubview(someoneThatDayHeartButton)
        view.addSubview(someoneThatDayMoreButton)
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
    
    private var someoneThatDayContentLabel: UILabel = {
        let label = UILabel()
        label.text = "하고 싶은 일이 있는데 뜻대로 되지 않아\n요. 친구들은 그저 제 배경만 보고 부러워\n하지만 그 안에서의 저는 죽을 맛입니다."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var someoneThatDayHeartButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var someoneThatDayMoreButton: UIButton = {
        let moreButton = UIButton()
        let image = UIImage(named: "more")
        moreButton.setImage(image, for: .normal)
        moreButton.translatesAutoresizingMaskIntoConstraints = false
        return moreButton
    }()
    
    private lazy var someoneThatDayCommentView: UIView = {
       let view = UIView()
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(someoneThatDayCommentLabel)
        view.addSubview(someoneThatDayCommentHeartButton)
        view.addSubview(someoneThatDayCommentMoreButton)
        return view
    }()
    
    private lazy var someoneThatDayCommentLabel: UILabel = {
        var label = UILabel()
        label.text = "저도 비슷한 상황을 겪어봐서 알아요. 그 누구도 나의 힘듬을 공감해주지 않는.. 화이팅"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var someoneThatDayCommentHeartButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "heart.selected")
        button.setImage(image, for: .normal)
        button.isEnabled = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var someoneThatDayCommentMoreButton: UIButton = {
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
        view.addSubview(someoneThatDayView)
        view.addSubview(someoneThatDayCommentView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 1, green: 0.904, blue: 0.904, alpha: 1).cgColor,
                        UIColor(red: 0.996, green: 0.846, blue: 0.846, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.locations = [0, 1]
        layer.frame = someoneThatDayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        someoneThatDayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setupAddTarget() {
        someoneThatDayHeartButton.addTarget(self, action: #selector(someoneThatDayHeartButtonTapped), for: .touchUpInside)
        someoneThatDayMoreButton.addTarget(self, action: #selector(someoneThatDayMoreButtonTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(reportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        someoneThatDayCommentMoreButton.addTarget(self, action: #selector(someoneThatDayCommentMoreButtonTapped), for: .touchUpInside)
        deleteAlertAction.deleteButton.addTarget(self, action: #selector(commentDeleteTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            someoneThatDayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            someoneThatDayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            someoneThatDayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            someoneThatDayView.widthAnchor.constraint(equalToConstant: 327),
            someoneThatDayView.heightAnchor.constraint(equalToConstant: 372),
            
            dateLabel.topAnchor.constraint(equalTo: someoneThatDayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: someoneThatDayView.leadingAnchor, constant: 24),
            
            someoneThatDayContentLabel.topAnchor.constraint(equalTo: someoneThatDayView.topAnchor, constant: 68),
            someoneThatDayContentLabel.bottomAnchor.constraint(equalTo: someoneThatDayView.bottomAnchor, constant: -260),
            someoneThatDayContentLabel.leadingAnchor.constraint(equalTo: someoneThatDayView.leadingAnchor, constant: 24),
            someoneThatDayContentLabel.trailingAnchor.constraint(equalTo: someoneThatDayView.trailingAnchor, constant: -24),
            
            someoneThatDayHeartButton.topAnchor.constraint(equalTo: someoneThatDayView.topAnchor, constant: 180),
            someoneThatDayHeartButton.trailingAnchor.constraint(equalTo: someoneThatDayView.trailingAnchor, constant: -70),
            
            someoneThatDayMoreButton.topAnchor.constraint(equalTo: someoneThatDayView.topAnchor, constant: 180),
            someoneThatDayMoreButton.trailingAnchor.constraint(equalTo: someoneThatDayView.trailingAnchor, constant: -30),
            
            someoneThatDayCommentView.topAnchor.constraint(equalTo: someoneThatDayView.topAnchor, constant: 230),
            someoneThatDayCommentView.bottomAnchor.constraint(equalTo: someoneThatDayView.bottomAnchor, constant: -24),
            someoneThatDayCommentView.leadingAnchor.constraint(equalTo: someoneThatDayView.leadingAnchor, constant: 16),
            someoneThatDayCommentView.trailingAnchor.constraint(equalTo: someoneThatDayView.trailingAnchor, constant: -16),
            someoneThatDayCommentView.widthAnchor.constraint(equalToConstant: 295),
            someoneThatDayCommentView.heightAnchor.constraint(equalToConstant: 172),
            
            someoneThatDayCommentLabel.topAnchor.constraint(equalTo: someoneThatDayCommentView.topAnchor, constant: 24),
            someoneThatDayCommentLabel.bottomAnchor.constraint(equalTo: someoneThatDayCommentView.bottomAnchor, constant: -60),
            someoneThatDayCommentLabel.leadingAnchor.constraint(equalTo: someoneThatDayCommentView.leadingAnchor, constant: 24),
            someoneThatDayCommentLabel.trailingAnchor.constraint(equalTo: someoneThatDayCommentView.trailingAnchor, constant: -24),
            
            someoneThatDayCommentHeartButton.bottomAnchor.constraint(equalTo: someoneThatDayCommentView.bottomAnchor, constant: -24),
            someoneThatDayCommentHeartButton.trailingAnchor.constraint(equalTo: someoneThatDayCommentView.trailingAnchor, constant: -70),
            
            someoneThatDayCommentMoreButton.bottomAnchor.constraint(equalTo: someoneThatDayCommentView.bottomAnchor, constant: -24),
            someoneThatDayCommentMoreButton.trailingAnchor.constraint(equalTo: someoneThatDayCommentView.trailingAnchor, constant: -30)
        ])
    }
    
    @objc private func someoneThatDayHeartButtonTapped() {
        if someoneThatDayHeartButton.isSelected == true {
            someoneThatDayHeartButton.isSelected = false
            someoneThatDayHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            someoneThatDayHeartButton.isSelected = true
            someoneThatDayHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: "당신의 마음을 전달했습니다.")
        }
    }
    
    @objc private func someoneThatDayMoreButtonTapped() {
        let actionsheetVC = reportAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func reportTapped() {
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
    
    @objc private func deleteTapped() {
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
    
    @objc private func someoneThatDayCommentMoreButtonTapped() {
        let actionsheetVC = deleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func commentDeleteTapped() {
        alert.showAlert("", subTitle: "이야기를 지우고 싶은가요?\n삭제하면 복구가 어려워요.",
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
