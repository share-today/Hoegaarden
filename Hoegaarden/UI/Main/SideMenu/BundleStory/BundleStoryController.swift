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
    private var eventDate: [Date] = []
    
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
        calendar.appearance.titleSelectionColor = .lightGray
        
        calendar.appearance.eventDefaultColor = .blue
        calendar.appearance.eventSelectionColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        calendar.appearance.eventOffset = CGPoint(x: 0, y: -7)
        calendar.allowsMultipleSelection = true
        
        calendar.appearance.todayColor = UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        calendar.appearance.selectionColor = .white
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
    }
    
    private func setup() {
        view.backgroundColor = .white
    }
    
    private func addViews() {
        view.addSubview(calendar)
    }
    
    func datesFromStrings(_ strings: [String]) -> [Date] {
        let dateFormatter = ISO8601DateFormatter()
        return strings.compactMap { dateFormatter.date(from: $0) }
    }
    
    private func setViewModel() {
        viewModel.getCalendar { [self] result in
            switch result {
            case .success(let value):
                print("Calendar Diary Response JSON: \(value)")
                
                if let json = value as? [String: Any],
                   let data = json["data"] as? [String: Any],
                   let calendar = data["calender"] as? [String] {
                    print("calendar:", calendar)
                    
                    let eventDates = datesFromStrings(calendar)
                    
                    self.eventDate = eventDates
                    
                    for date in eventDates {
                        self.calendar.select(date)
                    }
                    
                    self.calendar.reloadData()
                    print("dkdkdkdkdkdk \(eventDates)")
                    print("hfjghfjh \(eventDate)")
                }
                
            case .failure(let error):
                print("Calendar Diary Error: \(error.localizedDescription)")
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
    
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  titleFontFor date: Date) -> UIFont? {
        
        if calendar.gregorian.isDateInToday(date) {
            return Typography.subtitle2.font
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  eventColorFor date: Date) -> UIColor? {
        if eventDate.contains(date) {
            return calendar.appearance.eventDefaultColor
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar,
                  numberOfEventsFor date: Date) -> Int {
        if eventDate.contains(date) {
            return 1
        }
        return 0
    }
    
    func minimumDate(for calendar: FSCalendar) -> Date {
        return self.dateFormatter.date(from: "2023-09-01")!
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return self.dateFormatter.date(from: "2023-09-30")!
    }
    
    @objc private func showSideMenu() {
        let side = BundleSide()
        side.modalPresentationStyle = .overFullScreen
        present(side, animated: false, completion: nil)
    }
}
