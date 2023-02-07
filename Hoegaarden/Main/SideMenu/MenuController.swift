//
//  MenuController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/16.
//

import UIKit

class MenuController: UIViewController {
    
    var delegate: HomeControllerDelegate?
    
    var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        configureTableView()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = .white
    }
    
    func configureTableView() {
        tableView = UITableView()
        
        tableView.rowHeight = 80
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SideMenuCell.self, forCellReuseIdentifier: "MenuOptionCell")
        
        view.addSubview(tableView)
    }
    
    func setConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 300),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 20)
        ])
    }
}


extension MenuController: UITableViewDelegate, UITableViewDataSource {
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
