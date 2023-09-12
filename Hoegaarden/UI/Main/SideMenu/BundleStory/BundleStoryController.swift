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
    private var dateArray: [Date] = []
    var selectedDate: Date?
    
    private let calendar: FSCalendar = {
        let calendar = FSCalendar(frame: .zero)
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
    
    private func setViewModel() {
        viewModel.getCalendar { result in
            switch result {
            case .success(let data):
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let dataDict = json["data"] as? [String: Any],
                       let calendar = dataDict["calender"] as? [String] {
                        print("calendar:", calendar)
                        
                        let dateFormatter = DateFormatter()
                        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
                        dateFormatter.timeZone = TimeZone(identifier: "UTC")
                        let dateArray = calendar.compactMap { dateFormatter.date(from: $0) }

                        self.dateArray = dateArray
                        self.calendar.reloadData()
                    }
                } catch {
                    print("JSON parsing error: \(error.localizedDescription)")
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
    
    fileprivate var dateFormatter: DateFormatter = {
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
    
    func checkIfDateIsInArray(_ date: Date) -> Bool {
        return dateArray.contains { eventDate in
             Calendar.current.isDate(eventDate, inSameDayAs: date)
         }
    }

    // 다이어리 있는 날짜 텍스트 색상
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  titleDefaultColorFor date: Date) -> UIColor? {
        if checkIfDateIsInArray(date) {
            return .black
        }
        return nil
    }

    // 다이어리 있는 날짜 circle 표시
    func calendar(_ calendar: FSCalendar,
                  appearance: FSCalendarAppearance,
                  fillDefaultColorFor date: Date) -> UIColor? {
        if checkIfDateIsInArray(date) {
            return UIColor(red: 0.878, green: 0.914, blue: 1, alpha: 1)
        }
        return nil
    }
    
    func calendar(_ calendar: FSCalendar,
                  didSelect date: Date,
                  at monthPosition: FSCalendarMonthPosition) {
        if checkIfDateIsInArray(date) {
            
            let nextVC = BundleStoryView()
            nextVC.modalPresentationStyle = .fullScreen
            let nav = UINavigationController(rootViewController: nextVC)
            nav.modalPresentationStyle = .overFullScreen
            present(nav, animated: true, completion: nil)
            
        } else {
            print("이벤트가 없는 날짜")
        }
    }
}
