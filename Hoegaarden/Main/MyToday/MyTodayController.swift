//
//  MyTodayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyTodayController: UIViewController {
    
    private let myToday = MyToday()
    private let toast = Toast()
    private let alert = SweetAlert()
    private let modifyAndDeleteAlertAction = ModifyAndDeleteAlertAction()
    
    override func loadView() {
        view =  myToday
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
        setGradientLayer()
        setupGestureRecognizer()
    }
    
    private func setupAddTarget() {
        myToday.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        myToday.fillContentWillMoreButton.addTarget(self, action: #selector(fillContentWillMoreButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.modifyButton.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        modifyAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = myToday.myTodayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myToday.myTodayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func completion(isOn: Bool) {
        switch isOn {
        case true:
            let image = UIImage(named: "arrow-right-circle_black")
            myToday.sendButton.isUserInteractionEnabled = true
            myToday.sendButton.setImage(image, for: .normal)
            myToday.sendLabel.textColor = .black
        case false:
            let image = UIImage(named: "arrow-right-circle")
            myToday.sendButton.isUserInteractionEnabled = false
            myToday.sendButton.setImage(image, for: .normal)
            myToday.sendLabel.textColor = UIColor(red: 0.592, green: 0.592, blue: 0.592, alpha: 1)
        }
    }
    
    @objc private func sendButtonTapped() {
        alert.showAlert("", subTitle: "나의 오늘을 누군가에게 보낼까요?\n분명 나의 이야기를 잘 들어줄\n누군가에게 도착할 거예요.",
                        style: AlertStyle.customImage(imageFile: "send"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "보내기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                self.myToday.inputContent.resignFirstResponder()
                
                self.myToday.inputContent.isHidden = true
                self.myToday.contentCountLabel.isHidden = true
                self.myToday.sendLabel.isHidden = true
                self.myToday.sendButton.isHidden = true
                self.myToday.fillContentWillLabel.isHidden = false
                self.myToday.fillContentWillMoreButton.isHidden = false
                
                self.myToday.fillContentWillLabel.text = self.myToday.inputContent.text
                
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
                self.myToday.inputContent.resignFirstResponder()
                
                self.myToday.inputContent.isHidden = false
                self.myToday.contentCountLabel.isHidden = false
                self.myToday.sendLabel.isHidden = false
                self.myToday.sendButton.isHidden = false
                self.myToday.fillContentWillLabel.isHidden = true
                self.myToday.fillContentWillMoreButton.isHidden = true
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
    
                self.myToday.inputContent.isHidden = false
                self.myToday.contentCountLabel.isHidden = false
                self.myToday.sendLabel.isHidden = false
                self.myToday.sendButton.isHidden = false
                self.myToday.fillContentWillLabel.isHidden = true
                self.myToday.fillContentWillMoreButton.isHidden = true

                self.myToday.inputContent.text = self.myToday.textViewPlaceHolder
                self.myToday.inputContent.textColor = .lightGray
                self.myToday.contentCountLabel.text = "0/100"
                self.completion(isOn: false)
                
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: "삭제가 완료됐습니다.")
            }
        }
    }
}


extension MyTodayController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        myToday.contentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        myToday.contentCountLabel.isUserInteractionEnabled = true
    }
    
    @objc private func labelTapped(_ tapRecognizer: UITapGestureRecognizer) {
        alert.showAlert("", subTitle: "광고를 보면 최대 500자까지 더 많은\n마음속 이야기를 적을 수 있어요.",
                        style: AlertStyle.customImage(imageFile: "ad"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "광고 보기", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                // AD
                self.myToday.isCountLabelUpdated = false
                self.myToday.updateCountLabel(characterCount: self.myToday.inputContent.text.count)
            }
        }
    }
}
