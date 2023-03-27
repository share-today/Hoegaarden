//
//  Side.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/01.
//

import UIKit

class HomeSide: UIViewController {
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .darkGray.withAlphaComponent(0.7)
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
        return view
    }()
    
    private lazy var xButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(#imageLiteral(resourceName: "x"), for: .normal)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(xButtonClicked), for: .touchUpInside)
        return button
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setBackgroundView()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(sideMenuView)
        sideMenuView.addSubview(xButton)
        sideMenuView.addSubview(tableView)
    }
    
    private func setBackgroundView() {
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(backViewTapped(_:)))
        backgroundView.addGestureRecognizer(backgroundTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                
            sideMenuView.topAnchor.constraint(equalTo: view.topAnchor),
            sideMenuView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            sideMenuView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            sideMenuView.widthAnchor.constraint(equalToConstant: 200),
            
            xButton.topAnchor.constraint(equalTo: sideMenuView.safeAreaLayoutGuide.topAnchor, constant: 20),
            xButton.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: -30),
            
            tableView.topAnchor.constraint(equalTo: sideMenuView.safeAreaLayoutGuide.topAnchor, constant: 240),
            tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor, constant: 30),
            tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: -30),
            tableView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor, constant: -220)
        ])
    }
    
    @objc private func xButtonClicked() {
        self.dismiss(animated: false)
    }
    
    @objc private func backViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
}


extension HomeSide: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SideMenuOptions.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuOptionCell", for: indexPath) as! SideMenuCell
        let menuOption = SideMenuOptions(rawValue: indexPath.row)
        cell.sideMenuLabel.text = menuOption?.sideMenuLabel
        
        if menuOption == .home {
            cell.sideMenuLabel.isHidden = true
        }
        
        let option = SideMenuOptions.allCases[indexPath.row]
        cell.textLabel?.text = option.sideMenuLabel
        if option == .home {
            cell.textLabel?.font = Font.bold.of(size: 17)
            cell.textLabel?.textColor = .black
            cell.textLabel?.textAlignment = .center
            cell.setHomeIndicator()
        } else {
            cell.textLabel?.isHidden = true
           
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            dismiss(animated: false)
        case 1:
            let bundleVC = BundleStoryController()
            bundleVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: bundleVC)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true, completion: nil)
        case 2:
            let settingVC = SettingController()
            settingVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: settingVC)
            nav.modalPresentationStyle = .overFullScreen
            present(nav, animated: true, completion: nil)
        default:
            break
        }
    }
}