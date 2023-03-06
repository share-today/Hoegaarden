//
//  BundleStoryController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/03.
//

import UIKit
import SnapKit
import FSCalendar

class BundleStoryController: UIViewController, FSCalendarDataSource, FSCalendarDelegate {
        
    private let calendar: FSCalendar = {
        let calendar = FSCalendar()
        
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.backgroundColor = .white
        calendar.scrollEnabled = true
        calendar.pagingEnabled = false
        calendar.headerHeight = 100.0
        calendar.placeholderType = .none      // 이번 달이 아닌 날짜 나타나지 않게 하기
        
        calendar.appearance.headerDateFormat = "YY년 MM월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerTitleFont = Font.bold.of(size: 16)
        calendar.appearance.headerSeparatorColor = .clear
        
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.weekdayFont = Font.air.of(size: 16)
        
        calendar.appearance.titleDefaultColor = .lightGray
        calendar.appearance.titleFont = Font.air.of(size: 16)
        calendar.appearance.titleTodayColor = .black
        calendar.appearance.todayColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        calendar.appearance.selectionColor = .clear
        calendar.appearance.titleSelectionColor = .black
        
        return calendar
    }()
    
    lazy var todayButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Today", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 4
        button.titleLabel?.font = Font.bold.of(size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(todayButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        calendar.dataSource = self
        calendar.delegate = self
        
        addViews()
        setConstraints()
        configureNavigationBarButton()
    }
    
    func addViews() {
        view.addSubview(calendar)
    }
    
    func setConstraints() {
        calendar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().offset(-24)
        }
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(named: "menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showSideMenu))
    }
    
    @objc func todayButtonTapped() {
    }
    
    @objc func showSideMenu() {
        let side = BundleSide()
        side.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: side)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: false, completion: nil)
    }
    
    // 현재 달 이전은 안 보여주기
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
    }
}
