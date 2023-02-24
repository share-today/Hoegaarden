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
    }
    
    private func setupAddTarget() {
        someone.someoneYesterdayMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
    }
    
    @objc private func moreButtonTapped() {
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let reportAction = UIAlertAction(title: "신고하기", style: .default) { action in
            self.alert.showAlert("", subTitle: "누군가의 이야기로 불쾌했나요?\n게시물을 즉시 삭제하고, 검토를 통해\n해당 사용자를 제재할게요.",
                                 style: AlertStyle.customImage(imageFile: "frown"),
                                 buttonTitle: "취소", buttonColor: .white,
                                 otherButtonTitle: "신고하기", otherButtonColor: .black) { (isOtherButton) -> Void in
                if isOtherButton == true {
                    
                } else {
                    self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                         message: "신고가 완료됐습니다.")
                }
            }
        }
        
        let deleteAction = UIAlertAction(title: "삭제하기", style: .destructive) { action in
            self.alert.showAlert("", subTitle: "누군가의 이야기가 맘에 들지 않나요?\n지금 즉시 삭제할 수 있어요.",
                                 style: AlertStyle.customImage(imageFile: "trash"),
                                 buttonTitle: "취소", buttonColor: .white,
                                 otherButtonTitle: "삭제하기", otherButtonColor: .black) { (isOtherButton) -> Void in
                if isOtherButton == true {
                    
                } else {
                    self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                         message: "삭제가 완료됐습니다.")
                }
            }
        }
        
        alertController.addAction(reportAction)
        alertController.addAction(deleteAction)
        
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        
        present(alertController, animated: true, completion: nil)
    }
}
