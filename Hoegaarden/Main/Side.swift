//
//  Side.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/01.
//

import UIKit

class Side: UIViewController {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var sideMenuView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 0
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: "MenuOptionCell")
        return tableView
    }()
    
    var delegate: HomeControllerDelegate?
    var isExpanded: Bool = false
    private var defaultHeight: CGFloat = 180
    private var actionSheetViewTopConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setBackgroundView()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(sideMenuView)
        view.addSubview(tableView)
    }
    
    private func setBackgroundView() {
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(backViewTapped(_:)))
        backgroundView.addGestureRecognizer(backgroundTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenuView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sideMenuView.widthAnchor.constraint(equalToConstant: 200)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 250),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 300),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        ])
    }
    
    private func showActionSheet(shouldExpand: Bool, menuOption: SideMenuOptions?) {
//        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
//            self.backgroundView.alpha = 0.7
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
        if shouldExpand {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseIn, animations: {
                self.backgroundView.alpha = 0.7
                self.view.layoutIfNeeded()
            }) { (success) in }
        } else {
            UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
                
            }, completion: { (_) in
                guard let menuOption = menuOption else { return }
                self.didSelectMenuOptions(menuOptions: menuOption)
            })
        }
    }
    
    @objc func backViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
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
        let homeVC = HomeController()
        homeVC.modalPresentationStyle = .fullScreen
        self.present(homeVC, animated: false)
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
}


extension Side: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! SideMenuCell
        let menuOption = SideMenuOptions(rawValue: indexPath.row)
        
        cell.sideMenuLabel.text = menuOption?.sideMenuLabel
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menu = SideMenuOptions(rawValue: indexPath.row)
        delegate?.handleMenuToggle(forMenuOptions: menu)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension Side: HomeControllerDelegate {
    
    func handleMenuToggle(forMenuOptions menuOption: SideMenuOptions?) {
        if !isExpanded {
        }
        
        isExpanded = !isExpanded
        showActionSheet(shouldExpand: isExpanded, menuOption: menuOption)
    }
}
