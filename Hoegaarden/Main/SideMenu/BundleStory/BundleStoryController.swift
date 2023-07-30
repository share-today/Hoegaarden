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
        calendar.placeholderType = .none      // 이번 달이 아닌 날짜 나타나지 않게 하기
    
        calendar.headerHeight = 100.0
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
        calendar.appearance.titleSelectionColor = .lightGray

        calendar.appearance.eventDefaultColor = .lightGray
        calendar.appearance.eventSelectionColor = .black
        
        calendar.appearance.todayColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        calendar.appearance.selectionColor = .white
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        configureCalendar()
        setConstraints()
        configureNavigationBarButton()
    }
    
    private func setup() {
        view.backgroundColor = .white
    }
    
    private func addViews() {
        view.addSubview(calendar)
    }
    
    private func configureCalendar() {
        calendar.dataSource = self
        calendar.delegate = self
    }
    
    private func setConstraints() {
        calendar.snp.makeConstraints {
            $0.top.equalToSuperview().offset(120)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.left.equalToSuperview().offset(24)
            $0.right.equalToSuperview().offset(-24)
        }
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(named: "menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showSideMenu))
    }

    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let nextVC = BundleStoryView()
        nextVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: nextVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    fileprivate lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }()
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.dateFormatter.date(from: "2023-03-30")!
    }
        
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.dateFormatter.date(from: "2023-12-31")!
    }
    
    func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleFontFor date: Date) -> UIFont? {
        if calendar.gregorian.isDateInToday(date) {
            return Font.bold.of(size: 16)
        }
        return nil
    }
    
    func swipeRecognizer() {
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.respondToSwipeGesture(_:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
    }
    
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                self.dismiss(animated: true, completion: nil)
            default:
                break
            }
        }
    }
    
    @objc private func showSideMenu() {
        let side = BundleSide()
        side.modalPresentationStyle = .overFullScreen
        present(side, animated: false, completion: nil)
    }
}
