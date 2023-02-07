//
//  MyYesterdayController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/04.
//

import UIKit
import SnapKit

class MyYesterdayController: UIViewController {
    
    let page: Int
    private let myYesterday = MyYesterday()
    private let toast = Toast()
    
    init(page: Int) {
        self.page = page
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view =  myYesterday
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAddTarget()
    }
    
    func setupAddTarget() {
        myYesterday.myYesterdayCommentHeartButton.addTarget(self, action: #selector(heartButtonTapped), for: .touchUpInside)
        myYesterday.myYesterdayCommentMoreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
    }

    @objc func heartButtonTapped() {
        if myYesterday.myYesterdayCommentHeartButton.isSelected == true {
            myYesterday.myYesterdayCommentHeartButton.isSelected = false
            myYesterday.myYesterdayCommentHeartButton.setImage(UIImage(named: "heart"), for: .normal)
            
        } else {
            myYesterday.myYesterdayCommentHeartButton.isSelected = true
            myYesterday.myYesterdayCommentHeartButton.setImage(UIImage(named: "heart.selected"), for: .normal)
            toast.showToast(with: UIImage(imageLiteralResourceName: "heart.selected"))
            toast.showToast(message: "당신의 마음을 전달했습니다.")
        }
    }
    
    @objc func moreButtonTapped() {
        let action = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
//        action.addAction(UIAlertAction(title: "누군가에게 보내기", style: .default))
//        action.addAction(UIAlertAction(title: "수정하기", style: .default))
//        action.addAction(UIAlertAction(title: "삭제하기", style: .default))
//        action.view.tintColor = .black
//        present(action, animated: true)
        
        let send = UIAlertAction(title: "누군가에게 보내기", style: .default) { action in
        }

        let modify = UIAlertAction(title: "수정하기", style: .default)  { action in

        }

        let delete = UIAlertAction(title: "삭제하기", style: .default)  { action in

        }

        action.addAction(send)
        action.addAction(modify)
        action.addAction(delete)
        
        present(action, animated: true)
    }
}
