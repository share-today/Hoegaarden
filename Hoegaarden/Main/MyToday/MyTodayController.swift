//
//  MyTodayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyTodayController: UIViewController {
    
    let page: Int
    private let myToday = MyToday()
    private let toast = Toast()
    var alert = SweetAlert()
    
    init(page: Int) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view =  myToday
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
        setupGestureRecognizer()
    }
    
    func setupAddTarget() {
        myToday.sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
    }
    
    @objc func sendButtonTapped() {
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
}


extension MyTodayController {
    
    private func setupGestureRecognizer() {
        let tapGetstureRecognizer = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        myToday.contentCountLabel.addGestureRecognizer(tapGetstureRecognizer)
        myToday.contentCountLabel.isUserInteractionEnabled = true
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
