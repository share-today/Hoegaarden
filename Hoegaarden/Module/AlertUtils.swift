//
//  AlertUtils.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/28.
//

import UIKit

class AlertUtils: UIViewController {
    private let sweetAlert: SweetAlert = SweetAlert()
    
    func showAlert(viewController: UIViewController,
                   message: String,
                   imageFile: String,
                   otherButtonTitle: String,
                   completion: @escaping () -> Void) {
        
        viewController.addChild(sweetAlert)
        
        viewController.view.addSubview(sweetAlert.view)
        sweetAlert.didMove(toParent: viewController)
        
        sweetAlert.showAlert("",
                             subTitle: message,
                             style: AlertStyle.customImage(imageFile: imageFile),
                             buttonTitle: AlertMessage.cancelButton,
                             buttonColor: .white,
                             otherButtonTitle: otherButtonTitle,
                             otherButtonColor: .black) { (isOtherButton) -> Void in
            
            if !isOtherButton {
                self.sweetAlert.dismiss(animated: false)
                completion()
            }
        }
    }
}
