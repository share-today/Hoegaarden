//
//  MyYesterdayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit

class MyYesterdayController: UIViewController  {
    
    let page: Int
    private let myYesterday = MyYesterday()
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
        view = myYesterday
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    private func setupAddTarget() {
        myYesterday.myYesterdayMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        myYesterday.myYesterdayCommentHeartButton.addTarget(self, action: #selector(commentHeartButtonTapped), for: .touchUpInside)
        myYesterday.myYesterdayCommentMoreButton.addTarget(self, action: #selector(commmetMoreButtonTapped), for: .touchUpInside)
    }
    
    @objc private func moreButtonTapped() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        let deleteAction = UIAlertAction(title: "삭제하기", style: .default) { action in
            self.alert.showAlert("", subTitle: "이야기를 지우고 싶은가요?\n삭제하면 복구가 어려워요.",
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
        
        alertController.addAction(deleteAction)
        
        alertController.view.subviews.first?.subviews.first?.subviews.first?.backgroundColor = .white
        
        present(alertController, animated: true, completion: nil)
    }
    
    @objc func commentHeartButtonTapped() {
        if myYesterday.myYesterdayCommentHeartButton.isSelected == true {
            myYesterday.myYesterdayCommentHeartButton.isSelected = false
            myYesterday.myYesterdayCommentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            myYesterday.myYesterdayCommentHeartButton.isSelected = true
            myYesterday.myYesterdayCommentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(image: UIImage(imageLiteralResourceName: "heart.selected"),
                            message: "당신의 마음을 전달했습니다.")
        }
    }
    
    @objc func commmetMoreButtonTapped() {
        
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
