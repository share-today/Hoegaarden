//
//  Toast.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/02/02.
//

import UIKit
import SnapKit

class Toast {
    static let shared = Toast()
    var toastViews = [UIView?]()
    
    func showToast(message: String) {
        let toastView = UIView()
        self.toastViews.append(toastView)
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            toastView.alpha = 0.0
            toastView.backgroundColor = .lightGray
            window.addSubview(toastView)
            window.bringSubviewToFront(toastView)
            toastView.layer.cornerRadius = 8
            toastView.snp.makeConstraints({
                $0.width.equalTo(327)
                $0.height.equalTo(58)
                $0.centerX.equalToSuperview()
                $0.bottom.equalToSuperview().offset(-48)
            })
            let lbMsg = UILabel()
            toastView.addSubview(lbMsg)
            lbMsg.text = message
            lbMsg.textColor = .black
            lbMsg.textAlignment = .center
            lbMsg.font = UIFont(name: "Cafe24SsurroundAir", size: 14)
            lbMsg.snp.makeConstraints({
                $0.left.equalTo(100)
            })
            UIView.animate(withDuration: 4.0, delay: 0.0,options:[.curveEaseOut], animations: {
                toastView.alpha = 1.0
            })
            UIView.animate(withDuration: 4.0, delay: 0.0,options:[.curveEaseIn], animations: {
                toastView.alpha = 0.0
            },completion: { _ in
                toastView.removeFromSuperview()
                self.toastViews.removeFirst()
            })
        }
    }
    
    func showToast(with image: UIImage) {
        let toastView = UIView()
        self.toastViews.append(toastView)
        if let window = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first {
            toastView.alpha = 0.0
            toastView.backgroundColor = .lightGray
            window.addSubview(toastView)
            window.bringSubviewToFront(toastView)
            toastView.layer.cornerRadius = 8
            toastView.snp.makeConstraints({
                $0.width.equalTo(327)
                $0.height.equalTo(58)
                $0.centerX.equalToSuperview()
                $0.bottom.equalToSuperview().offset(-48)
            })
            let img = UIImageView()
            toastView.addSubview(img)
            img.snp.makeConstraints {
                $0.centerX.equalToSuperview()
                $0.width.equalTo(20)
                $0.height.equalTo(18)
            }
            UIView.animate(withDuration: 4.0, delay: 0.0, options: [.curveEaseOut], animations: {
                toastView.alpha = 1.0
            })
            UIView.animate(withDuration: 4.0, delay: 0.0, options: [.curveEaseIn], animations: {
                toastView.alpha  = 0.0
            }, completion: { _ in
                toastView.removeFromSuperview()
                self.toastViews.removeFirst()
            })
        }
    }
}
