////
////  Homeside.swift
////  Hoegaarden
////
////  Created by 혜리 on 2022/12/16.
////
//
//import UIKit
//
//class HomeSide: UIViewController {
//    
////    var menuController: MenuController!
//    var centerController: UIViewController!
//    let overlayView = UIView()
//    var isExpanded: Bool = false
//    
//    private lazy var backgroundView: UIView = {
//        let view = UIView()
//        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        view.addSubview(backgroundView)
//        configureHomeController()
//        setConstraints()
//    }
//
//    func configureHomeController() {
//        let homeController = HomeController()
//        homeController.delegate = self
//        
//        centerController = UINavigationController(rootViewController: homeController)
//        view.addSubview(centerController.view)
//        addChild(centerController)
//        centerController.didMove(toParent: self)
//    }
//    
//    func configureMenuController() {
//        if menuController == nil {
//            menuController = MenuController()
//            menuController.delegate = self
//            view.insertSubview(menuController.view, at: 0)
//            addChild(menuController)
//            menuController.didMove(toParent: self)
//        }
//    }
//    
//    private func setConstraints() {
//        
//        NSLayoutConstraint.activate([
//            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
//            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//    }
//    
//    func showMenuController(shouldExpand: Bool, menuOption: SideMenuOptions?) {
////        if shouldExpand {
////            UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
////                self.view.layoutIfNeeded()
////            }, completion: { (_) in
////                guard let menuOption = menuOption else { return }
////                self.didSelectMenuOptions(menuOptions: menuOption)
////            })
////        }
//        
//        if shouldExpand {
//            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
//                self.backgroundView.alpha = 0.7
//                self.view.layoutIfNeeded()
////                self.overlayView.alpha = (self.isExpanded) ? 0.5 : 0.0
//            }) { (success) in }
//        } else {
//            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
//
//            }, completion: { (_) in
//                guard let menuOption = menuOption else { return }
//                self.didSelectMenuOptions(menuOptions: menuOption)
//            })
//        }
//        let bounds = self.view.bounds
//        let width: CGFloat = (isExpanded) ? bounds.width * 2 / 3 : 1.0
//        if shouldExpand {
//                    UIView.animate(withDuration: 0.3, animations: {
//                        self.centerController.view.frame = CGRect(x: 0, y: 0, width: width, height: bounds.height)
//                        self.overlayView.alpha = (self.isExpanded) ? 0.5 : 0.0
//                    }) { (success) in }
//                } else {
//                    UIView.animate(withDuration: 0.3, animations: {
//
//                    }, completion: { (_) in
//                        guard let menuOption = menuOption else { return }
//                        self.didSelectMenuOptions(menuOptions: menuOption)
//                    })
//                }
//    }
//        
//    func didSelectMenuOptions(menuOptions: SideMenuOptions) {
//        switch menuOptions {
//        case .home:
//            showHomeController()
//        case .bundleStory:
//            showBundleStoryController()
//        case .settings:
//            showSettingController()
//        }
//    }
//    
//    func showHomeController() {
//        let bundleVC = HomeSide()
//        bundleVC.modalPresentationStyle = .fullScreen
//        self.present(bundleVC, animated: false)
//    }
//    
//    func showBundleStoryController() {
//        let bundleVC = BundleSide()
//        bundleVC.modalPresentationStyle = .fullScreen
//        self.present(bundleVC, animated: true)
//    }
//    
//    func showSettingController() {
//        let settingVC = SettingSide()
//        settingVC.modalPresentationStyle = .fullScreen
//        self.present(settingVC, animated: true)
//    }
//}
//
//
//extension HomeSide: HomeControllerDelegate {
//    
//    func handleMenuToggle(forMenuOptions menuOption: SideMenuOptions?) {
//        if !isExpanded {
//            configureMenuController()
//        }
//        
//        isExpanded = !isExpanded
//        showMenuController(shouldExpand: isExpanded, menuOption: menuOption)
//    }
//}
