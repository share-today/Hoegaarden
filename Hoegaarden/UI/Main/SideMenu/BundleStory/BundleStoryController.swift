//
//  BundleStoryController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/03.
//

import UIKit
import SnapKit
import FSCalendar

class BundleStoryController: GestureViewController, FSCalendarDataSource, FSCalendarDelegate {
    
    private let viewModel = BundleStoryViewModel()
    private var eventsArray = [Date]()
    var eventsByDate: [String: [String]] = [:]
    
    
    private let calendar: FSCalendar = {
        let calendar = FSCalendar()
        calendar.locale = Locale(identifier: "ko_KR")
        calendar.backgroundColor = .white
        calendar.scrollEnabled = true
        calendar.pagingEnabled = false
        calendar.placeholderType = .none
        
        calendar.headerHeight = 100.0
        calendar.appearance.headerDateFormat = "YY년 MM월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleAlignment = .left
        calendar.appearance.headerTitleFont = Typography.subtitle2.font
        calendar.appearance.headerSeparatorColor = .clear
        
        calendar.appearance.weekdayTextColor = .black
        calendar.appearance.weekdayFont = Typography.body2.font
        
        calendar.appearance.titleDefaultColor = .lightGray
        calendar.appearance.titleFont = Typography.body2.font
        calendar.appearance.titleTodayColor = .black
        
        calendar.appearance.todayColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        calendar.appearance.selectionColor = .clear
        
        return calendar
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setViewModel()
        configureCalendar()
        setConstraints()
        configureNavigationBarButton()
        
        eventsByDate["2023-09-03"] = ["이벤트 1", "이벤트 2"]
        eventsByDate["2023-09-04"] = ["이벤트 3"]
    }
    
    private func setup() {
        view.backgroundColor = .white
    }
    
    private func addViews() {
        view.addSubview(calendar)
    }
    
    private func setViewModel() {
        viewModel.getCalendar { result in
            switch result {
            case .success(let value):
                print("Calendar Diary Response JSON: \(value)")
                
                if let json = value as? [String: Any],
                   let data = json["data"] as? [String: Any],
                   let calendar = data["calender"] as? [String] {
                    print("calendar:", calendar)
                    
//                    let dateFormatter = ISO8601DateFormatter()
//                    dateFormatter.formatOptions = [.withInternetDateTime]
//                    eventDate = calendar.compactMap { dateFormatter.date(from: $0) }

//                    self.calendar.reloadData()
                }
                
            case .failure(let error):
                print("Calendar Diary Errorrr: \(error.localizedDescription)")
            }
        }
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
    
    func calendar(_ calendar: FSCalendar,
                  didSelect date: Date,
                  at monthPosition: FSCalendarMonthPosition) {
        
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
        return self.dateFormatter.date(from: "2023-09-01")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.dateFormatter.date(from: "2023-10-31")!
    }
    
    @objc private func showSideMenu() {
        let side = BundleSide()
        side.modalPresentationStyle = .overFullScreen
        present(side, animated: false, completion: nil)
    }
}

extension BundleStoryController: FSCalendarDelegateAppearance {
    
    // 다이어리 있는 날짜 텍스트 색상
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor? {
        if let events = eventsByDate[dateFormatter.string(from: date)], events.count > 0 {
            return .black
        }
        
        return nil
    }
    
    // 다이어리 있는 날짜 circle 표시
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  fillDefaultColorFor date: Date) -> UIColor? {
        if let events = eventsByDate[dateFormatter.string(from: date)], events.count > 0 {
            return UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  titleSelectionColorFor date: Date) -> UIColor? {
        return nil
    }
}
