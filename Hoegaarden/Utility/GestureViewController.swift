//
//  GestureViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/23.
//

import UIKit

class GestureViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setGesture()
    }
    
    private func setGesture() {
        let swipeGestureRecognizer = UIScreenEdgePanGestureRecognizer(target: self, action: #selector(handleSwipeGesture(_:)))
        swipeGestureRecognizer.edges = .left
        view.addGestureRecognizer(swipeGestureRecognizer)
    }
    
    @objc private func handleSwipeGesture(_ gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        if gestureRecognizer.state == .recognized {
            self.dismiss(animated: false, completion: nil)
        }
    }
}
