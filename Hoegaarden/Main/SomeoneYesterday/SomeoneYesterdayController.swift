//
//  SomeoneYesterdayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class SomeoneYesterdayController: UIViewController {
    
    let page: Int
    private let someone = SomeoneYesterday()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    private let toast = Toast()
    private var alert = SweetAlert()
    
    init(page: Int) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
            if isOtherButton == true {

            } else {
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
            if isOtherButton == true { } else {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("", subTitle: "나의 오늘을 누군가에게 보낼까요?\n분명 나의 이야기를 잘 들어줄\n누군가에게 도착할 거예요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { } else {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "send"),
                                     message: "전송이 완료됐습니다.")
            }
        }
    }
    
    @objc private func handleTap(_ gestureRecognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}


extension SomeoneYesterdayController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        someone.someoneYesterdayContentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        someone.someoneYesterdayContentCountLabel.isUserInteractionEnabled = true
    }
    
    @objc func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("", subTitle: "광고를 보면 최대 500자까지 더 많은\n마음속 이야기를 적을 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "광고 보기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true {
                
            } else {
                // AD
                
            }
        }
    }
}
