//
//  NoticeMainViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit

class NoticeMainViewController: GestureViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleLabel)
        imageView.addSubview(separatorView)
        imageView.addSubview(yesterdayHeartView)
        imageView.addSubview(commentHeartView)
        imageView.addSubview(noticeView)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Notices.noticeMain
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
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
    
    private let yesterdayHeartDate: UILabel = {
        let label = UILabel()
        label.text = Notices.minuteAgo
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var yesterdayHeartContent: UILabel = {
        let label = UILabel()
        label.text = Notices.yesterdayHeartNotice
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
    
    private var commentHeartDate: UILabel = {
        let label = UILabel()
        label.text = Notices.dateAgo
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var commentHeartContent: UILabel = {
        let label = UILabel()
        label.text = Notices.heartNotice
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
    
    private var noticeDate: UILabel = {
        let label = UILabel()
        label.text = Notices.dateAgo
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var noticeContent: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Notices.allNotice, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 14)
        button.contentHorizontalAlignment = .left
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
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(backgroundImage)
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: backgroundImage.topAnchor, constant: 80),
            titleLabel.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 36),
            
            separatorView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            separatorView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            separatorView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
            
            yesterdayHeartView.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 17),
            yesterdayHeartView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            yesterdayHeartView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -24),
            yesterdayHeartView.widthAnchor.constraint(equalToConstant: 327),
            yesterdayHeartView.heightAnchor.constraint(equalToConstant: 96),
            
            yesterdayHeartDate.topAnchor.constraint(equalTo: yesterdayHeartView.topAnchor, constant: 16),
            yesterdayHeartDate.leadingAnchor.constraint(equalTo: yesterdayHeartView.leadingAnchor, constant: 16),
            
            yesterdayHeartContent.bottomAnchor.constraint(equalTo: yesterdayHeartView.bottomAnchor, constant: -20),
            yesterdayHeartContent.leadingAnchor.constraint(equalTo: yesterdayHeartView.leadingAnchor, constant: 16),
            yesterdayHeartContent.trailingAnchor.constraint(equalTo: yesterdayHeartView.trailingAnchor, constant: -16),
            
            commentHeartView.topAnchor.constraint(equalTo: yesterdayHeartView.bottomAnchor, constant: 17),
            commentHeartView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            commentHeartView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -24),
            commentHeartView.widthAnchor.constraint(equalToConstant: 327),
            commentHeartView.heightAnchor.constraint(equalToConstant: 118),
            
            commentHeartDate.topAnchor.constraint(equalTo: commentHeartView.topAnchor, constant: 16),
            commentHeartDate.leadingAnchor.constraint(equalTo: commentHeartView.leadingAnchor, constant: 16),
            
            commentHeartContent.bottomAnchor.constraint(equalTo: commentHeartView.bottomAnchor, constant: -20),
            commentHeartContent.leadingAnchor.constraint(equalTo: commentHeartView.leadingAnchor, constant: 16),
            commentHeartContent.trailingAnchor.constraint(equalTo: commentHeartView.trailingAnchor, constant: -16),
            
            noticeView.topAnchor.constraint(equalTo: commentHeartView.bottomAnchor, constant: 17),
            noticeView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            noticeView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -24),
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
        let controller = NoticeViewController()
        controller.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func showPrevious() {
       dismiss(animated: false)
    }
}
