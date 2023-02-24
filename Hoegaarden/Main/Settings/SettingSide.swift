//
//  SettingSide.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/27.
//

import UIKit

class SettingSide: UIViewController {
    
    var menuController: MenuController!
    var centerController: UIViewController!
    var isExpanded: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBundleController()
    }
    
    func configureBundleController() {
        let settingController = SettingController()
        settingController.delegate = self
        
        centerController = UINavigationController(rootViewController: settingController)
        
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
            // show menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                self.centerController.view.frame.origin.x -= (self.menuController.view.frame.width - 300) }
        } else {
            // hide menu
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
        let homeVC = HomeSide()
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: true)
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
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveLinear) {
            self.setNeedsStatusBarAppearanceUpdate()
        } completion: { (_) in }
    }
}


extension SettingSide: HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOptions menuOption: SideMenuOptions?) {
        if !isExpanded {
            configureMenuController()
        }
        
        isExpanded = !isExpanded
        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
