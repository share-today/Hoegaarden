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
    
    func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(sideMenuView)
        view.addSubview(xButton)
        view.addSubview(tableView)
    }
    
    func setBackgroundView() {
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(backViewTapped(_:)))
        backgroundView.addGestureRecognizer(backgroundTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    func setConstraints() {
        
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
            xButton.topAnchor.constraint(equalTo: sideMenuView.safeAreaLayoutGuide.topAnchor, constant: 20),
            xButton.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: sideMenuView.topAnchor, constant: 220),
            tableView.bottomAnchor.constraint(equalTo: sideMenuView.bottomAnchor, constant: -220),
            tableView.leadingAnchor.constraint(equalTo: sideMenuView.leadingAnchor, constant: 50),
            tableView.trailingAnchor.constraint(equalTo: sideMenuView.trailingAnchor, constant: -50)
        ])
    }
    
    @objc private func xButtonClicked() {
        self.dismiss(animated: false)
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
    
}


extension HomeSide: UITableViewDelegate, UITableViewDataSource {
    
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
        switch indexPath.row {
        case 0:
            dismiss(animated: false)
            let indicatorView = UIView(frame: CGRect(x: 0, y: 0, width: 72, height: 18))
            indicatorView.backgroundColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
            indicatorView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(indicatorView)
        case 1:
            let bundleVC = BundleStoryController()
            bundleVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: bundleVC)
            nav.modalPresentationStyle = .overFullScreen
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
