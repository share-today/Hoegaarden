//
//  HomeController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2022/12/16.
//

import UIKit
import Tabman
import Pageboy

class HomeController: TabmanViewController, PageboyViewControllerDataSource, TMBarDataSource {
        
    private lazy var viewControllers: [UIViewController] = [
        MyTodayController(page: 1),
        MyYesterdayController(page: 2),
        SomeoneYesterdayController(page: 3)
    ]
    
    lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureBar()
        configureView()
        configureNavigationBarButton()
    }
    
    func configureBar() {
        dataSource = self
        let bar = TMBarView.ButtonBar()

        bar.layout.contentInset = UIEdgeInsets(top: 80.0, left: 24.0, bottom: 4.0, right: 16.0)
        bar.layout.interButtonSpacing = 50.0
        bar.fadesContentEdges = true
        bar.clipsToBounds = false
        bar.layer.borderWidth = 0
        bar.buttons.customize {
            $0.tintColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1)
            $0.selectedTintColor = .black
            $0.adjustsFontForContentSizeCategory = true
            $0.font = Font.air.of(size: 16)
            $0.selectedFont = Font.bold.of(size: 16)
        }
//        bar.indicator.size = .custom(value: CGRect(x: 0, y: 0, width: 72, height: 150))
        bar.indicator.tintColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        bar.backgroundColor = .white
        addBar(bar.systemBar(), dataSource: self, at: .top)
    }
    
    func configureView() {
        view.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: view.topAnchor, constant: 227),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func configureNavigationBarButton() {
        let leftImage = UIImage(named: "notice")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightImage = UIImage(named: "menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: leftImage, style: .done,
            target: self, action: #selector(showNotice))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: rightImage, style: .done,
            target: self, action: #selector(showSideMenu))
    }
    
    @objc func showNotice() {
        let noticeVC = Notification()
        noticeVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: noticeVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc func showSideMenu() {
        let vc = HomeSide()
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: false, completion: nil)
    }
    
    // MARK: - PageboyViewControllerDataSource
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    // MARK: - TMBarDataSource
    
    func barItem(for bar: Tabman.TMBar, at index: Int) -> Tabman.TMBarItemable {
        switch index {
        case 0:
            return TMBarItem(title: "나의 오늘")
        case 1:
            return TMBarItem(title: "나의 어제")
        case 2:
            return TMBarItem(title: "누군가의 어제")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
    }
}



//import Tabman
//import Pageboy
//
//class MyViewController: TabmanViewController, PageboyViewControllerDataSource {
//
//    private let tabTitles = ["Tab 1", "Tab 2", "Tab 3"]
//    private var viewControllers = [UIViewController]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Add child view controllers to viewControllers array
//        // ...
//
//        // Customize appearance of the bar
//        let bar = self.bar as! TMBar
//        bar.layout.transitionStyle = .snap
//        bar.layout.contentMode = .fit
//
//        // Create indicator view and add it to the bar
//        let indicator = TMBarIndicatorView()
//        indicator.tintColor = UIColor.red
//        indicator.indicatorSize = CGSize(width: 50, height: 5)
//        bar.addIndicator(indicator, to: .top)
//
//        // Set up indicator to restrict scroll range and disable edges
//        indicator.layoutIfNeeded()
//        let indicatorWidth = indicator.bounds.width
//        let tabWidth = bar.bounds.width / CGFloat(tabTitles.count)
//        let margin = (tabWidth - indicatorWidth) / 2.0
//        let insets = UIEdgeInsets(top: 0, left: margin, bottom: 0, right: margin)
//        indicator.indicatorInset = insets
//        indicator.indicatorEndInset = insets
//
//        // Set up page view controller
//        self.dataSource = self
//        self.viewControllers = viewControllers
//
//        // Reload data
//        self.reloadData()
//    }
//
//    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
//        return viewControllers.count
//    }
//
//    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
//        return viewControllers[index]
//    }
//
//    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
//        return nil
//    }
//}
