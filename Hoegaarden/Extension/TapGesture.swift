//
//  TapGesture.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/09/05.
//

import UIKit

extension UIViewController {
    func addTapToDismissKeyboardGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
