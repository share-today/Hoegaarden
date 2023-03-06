//
//  Notification.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit

class Notification: UIViewController {
    
    private var noticeLabel: UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var yesterdayHeartView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 0.8).cgColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(yesterdayHeartDate)
        view.addSubview(yesterdayHeartContent)
        return view
    }()
    
    private lazy var yesterdayHeartDate: UILabel = {
        let label = UILabel()
        label.text = "00분 전"
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var yesterdayHeartContent: UILabel = {
        let label = UILabel()
        label.text = "❤️ 누군가 당신의 어제에 마음을 보냈어요."
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentHeartView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 0.922, green: 0.922, blue: 0.922, alpha: 0.8).cgColor
        view.layer.cornerRadius = 8
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(commentHeartDate)
        view.addSubview(commentHeartContent)
        return view
    }()
    
    private lazy var commentHeartDate: UILabel = {
        let label = UILabel()
        label.text = "00월 00일"
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var commentHeartContent: UILabel = {
        let label = UILabel()
        label.text = "❤️ 당신이 보내준 코멘트가 누군가의 마음에 닿았\n어요."
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var noticeView: UIView = {
        let view = UIView()
        view.layer.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8).cgColor
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor(red: 0.746, green: 0.746, blue: 0.746, alpha: 1).cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(noticeDate)
        view.addSubview(noticeContent)
        return view
    }()
    
    private lazy var noticeDate: UILabel = {
        let label = UILabel()
        label.text = "00월 00일"
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var noticeContent: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("📢 좋은 소식이 있어요! 클릭하여 확인해 주세요!", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 14)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(noticeButtonClicked), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        configureNavigationBarButton()
        setConstraints()
    }
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        view.addSubview(noticeLabel)
        view.addSubview(lineView)
        view.addSubview(yesterdayHeartView)
        view.addSubview(commentHeartView)
        view.addSubview(noticeView)
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    @objc func showPrevious() {
        let nextVC = HomeController()
        nextVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: nextVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: false, completion: nil)
    }
    
    func setConstraints() {
        NSLayoutConstraint.activate([
            noticeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            noticeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            
            lineView.topAnchor.constraint(equalTo: noticeLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            yesterdayHeartView.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 17),
            yesterdayHeartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            yesterdayHeartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            yesterdayHeartView.widthAnchor.constraint(equalToConstant: 327),
            yesterdayHeartView.heightAnchor.constraint(equalToConstant: 96),
            
            yesterdayHeartDate.topAnchor.constraint(equalTo: yesterdayHeartView.topAnchor, constant: 16),
            yesterdayHeartDate.leadingAnchor.constraint(equalTo: yesterdayHeartView.leadingAnchor, constant: 16),
            
            yesterdayHeartContent.bottomAnchor.constraint(equalTo: yesterdayHeartView.bottomAnchor, constant: -20),
            yesterdayHeartContent.leadingAnchor.constraint(equalTo: yesterdayHeartView.leadingAnchor, constant: 16),
            yesterdayHeartContent.trailingAnchor.constraint(equalTo: yesterdayHeartView.trailingAnchor, constant: -16),
            
            commentHeartView.topAnchor.constraint(equalTo: yesterdayHeartView.bottomAnchor, constant: 17),
            commentHeartView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            commentHeartView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            commentHeartView.widthAnchor.constraint(equalToConstant: 327),
            commentHeartView.heightAnchor.constraint(equalToConstant: 118),
            
            commentHeartDate.topAnchor.constraint(equalTo: commentHeartView.topAnchor, constant: 16),
            commentHeartDate.leadingAnchor.constraint(equalTo: commentHeartView.leadingAnchor, constant: 16),
            
            commentHeartContent.bottomAnchor.constraint(equalTo: commentHeartView.bottomAnchor, constant: -20),
            commentHeartContent.leadingAnchor.constraint(equalTo: commentHeartView.leadingAnchor, constant: 16),
            commentHeartContent.trailingAnchor.constraint(equalTo: commentHeartView.trailingAnchor, constant: -16),
            
            noticeView.topAnchor.constraint(equalTo: commentHeartView.bottomAnchor, constant: 17),
            noticeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            noticeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            noticeView.widthAnchor.constraint(equalToConstant: 327),
            noticeView.heightAnchor.constraint(equalToConstant: 96),
            
            noticeDate.topAnchor.constraint(equalTo: noticeView.topAnchor, constant: 16),
            noticeDate.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 16),
            
            noticeContent.bottomAnchor.constraint(equalTo: noticeView.bottomAnchor, constant: -20),
            noticeContent.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 16),
            noticeContent.trailingAnchor.constraint(equalTo: noticeView.trailingAnchor, constant: -16)
        ])
    }
    
    @objc private func noticeButtonClicked() {
        let controller = Notice()
        controller.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
}
