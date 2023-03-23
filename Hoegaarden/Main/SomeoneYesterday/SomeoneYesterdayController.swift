//
//  SomeoneYesterdayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class SomeoneYesterdayController: UIViewController {
    
    private let someone = SomeoneYesterday()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    private let toast = Toast()
    private let alert = SweetAlert()
    
    override func loadView() {
        view = someone
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
        setupGestureRecognizer()
    }
    
    private func setupAddTarget() {
        someone.someoneYesterdayHeartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        someone.someoneYesterdayMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(reportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(someoneDeleteTapped), for: .touchUpInside)
        someone.someoneYesterdaySendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        someone.fillContentWillCommentMoreButton.addTarget(self, action: #selector(fillContentWillCommentMoreButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.modifyButton.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func completion(isOn: Bool) {
        switch isOn {
        case true:
            let image = UIImage(named: "arrow-right-circle_black")
            someone.someoneYesterdaySendButton.isUserInteractionEnabled = true
            someone.someoneYesterdaySendButton.setImage(image, for: .normal)
            someone.someoneYesterdaySendLabel.textColor = .black
        case false:
            let image = UIImage(named: "arrow-right-circle")
            someone.someoneYesterdaySendButton.isUserInteractionEnabled = false
            someone.someoneYesterdaySendButton.setImage(image, for: .normal)
            someone.someoneYesterdaySendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        }
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
    
    @objc private func heartButtonTapped() {
        if someone.someoneYesterdayHeartButton.isSelected == true {
            someone.someoneYesterdayHeartButton.isSelected = false
            someone.someoneYesterdayHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            someone.someoneYesterdayHeartButton.isSelected = true
            someone.someoneYesterdayHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: "당신의 마음을 전달했습니다.")
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
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false, completion: nil)
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                     message: "신고가 완료됐습니다.")
            }
        }
    }
    
    @objc private func someoneDeleteTapped() {
        alert.showAlert("", subTitle: "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false, completion: nil)
                self.emptyStateAllDeletedView()
                
                self.someone.someoneYesterdayView.isHidden = true
                self.someone.someoneYesterdayCommentView.isHidden = true
                    
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("", subTitle: "이야기를 누군가에게 보낼까요?\n이야기를 전달받은 누군가의 마음은 따뜻해질 거예요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.someone.someoneYesterdayInputContent.resignFirstResponder()
                
                self.someone.someoneYesterdayInputContent.isHidden = true
                self.someone.someoneYesterdayContentCountLabel.isHidden = true
                self.someone.someoneYesterdaySendLabel.isHidden = true
                self.someone.someoneYesterdaySendButton.isHidden = true
                self.someone.fillContentWillCommentLabel.isHidden = false
                self.someone.fillContentWillCommentMoreButton.isHidden = false
                
                self.someone.fillContentWillCommentLabel.text = self.someone.someoneYesterdayInputContent.text

                self.toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                     message: "전송이 완료됐습니다.")
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
            if isOtherButton == true { }
            else {
                self.dismiss(animated: false)
                self.someone.someoneYesterdayInputContent.resignFirstResponder()
                
                self.someone.someoneYesterdayInputContent.isHidden = false
                self.someone.someoneYesterdayContentCountLabel.isHidden = false
                self.someone.someoneYesterdaySendLabel.isHidden = false
                self.someone.someoneYesterdaySendButton.isHidden = false
                self.someone.fillContentWillCommentLabel.isHidden = true
                self.someone.fillContentWillCommentMoreButton.isHidden = true
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
    
                self.someone.someoneYesterdayInputContent.isHidden = false
                self.someone.someoneYesterdayContentCountLabel.isHidden = false
                self.someone.someoneYesterdaySendLabel.isHidden = false
                self.someone.someoneYesterdaySendButton.isHidden = false
                self.someone.fillContentWillCommentLabel.isHidden = true
                self.someone.fillContentWillCommentMoreButton.isHidden = true

                self.someone.someoneYesterdayInputContent.text = self.someone.textViewPlaceHolder
                self.someone.someoneYesterdayInputContent.textColor = .lightGray
                self.someone.someoneYesterdayContentCountLabel.text = "0/50"
                self.completion(isOn: false)
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
}


extension SomeoneYesterdayController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        someone.someoneYesterdayContentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        someone.someoneYesterdayContentCountLabel.isUserInteractionEnabled = true
    }
    
    @objc func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("", subTitle: "광고를 보면 최대 300자까지 더 많은\n마음속 이야기를 적을 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "광고 보기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                self.someone.isCountLabelUpdated = false
                self.someone.updateCountLabel(characterCount: self.someone.someoneYesterdayInputContent.text.count)
            }
        }
    }
}
