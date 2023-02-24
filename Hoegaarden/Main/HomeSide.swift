//
//  Homeside.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/16.
//

import UIKit

class HomeSide: UIViewController {
    
    var menuController: MenuController!
    var centerController: UIViewController!
    let overlayView = UIView()
    var isExpanded: Bool = false
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        return .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        return isExpanded
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureOverlayView()
        configureHomeController()
        configureGestures()
    }
    
    func configureOverlayView() {
        overlayView.backgroundColor = .black
        overlayView.alpha = 0
        view.addSubview(overlayView)
    }

    func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        
        centerController = UINavigationController(rootViewController: homeController)
        view.addSubview(centerController.view)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController.delegate = self
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
        }
    }
    
    func showMenuController(shouldExpand: Bool, menuOption: SideMenuOptions?) {
        let bounds = self.view.bounds
        let width: CGFloat = (isExpanded) ? bounds.width * 2 / 3 : 1.0
        
        if shouldExpand {
            UIView.animate(withDuration: 0.3, animations: {
                self.centerController.view.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
                self.overlayView.alpha = (self.isExpanded) ? 0.5 : 0.0
            }) { (success) in }
        } else {
            UIView.animate(withDuration: 0.3, animations: {
                
            }, completion: { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOptions(menuOptions: menuOption)
            })
        }
    }
    
    fileprivate func configureGestures() {
        let swipeRightGesture = UISwipeGestureRecognizer(target: self, action: #selector(didSwipeRight))
        swipeRightGesture.direction = .right
        overlayView.addGestureRecognizer(swipeRightGesture)

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapOverlay))
        overlayView.addGestureRecognizer(tapGesture)
    }
        
    func didSelectMenuOptions(menuOptions: SideMenuOptions) {
        switch menuOptions {
        case .home:
            showHomeController()
        case .bundleStory:
            showBundleStoryController()
        case .settings:
            showSettingController()
        }
    }
    
    func showHomeController() {
        let bundleVC = HomeSide()
        bundleVC.modalPresentationStyle = .fullScreen
        self.present(bundleVC, animated: false)
    }
    
    func showBundleStoryController() {
        let bundleVC = BundleSide()
        bundleVC.modalPresentationStyle = .fullScreen
        self.present(bundleVC, animated: true)
    }
    
    func showSettingController() {
        let settingVC = SettingSide()
        settingVC.modalPresentationStyle = .fullScreen
        self.present(settingVC, animated: true)
    }
    
    @objc func didSwipeRight() {
//        showMenuController(shouldExpand: false, menuOption: SideMenuOptions?)
        dismiss(animated: true)
    }

    @objc func didTapOverlay() {
//        showMenuController(shouldExpand: false, menuOption: SideMenuOptions?)
        dismiss(animated: true)
    }
}


extension HomeSide: HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOptions menuOption: SideMenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
