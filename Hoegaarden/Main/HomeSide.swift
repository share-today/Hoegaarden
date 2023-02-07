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
        
        configureHomeController()
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
        if shouldExpand {
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x -= (self.centerController.view.frame.width - 300) }
        } else {
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x = 0
            } completion: { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOptions(menuOptions: menuOption)
            }
        }
        animateStatusBar()
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
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
            self.setNeedsStatusBarAppearanceUpdate()
        } completion: { (_) in }
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
