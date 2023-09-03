//
//  NoticeViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/05.
//

import UIKit

class NoticeViewController: GestureViewController {
    
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.addSubview(titleLabel)
        imageView.addSubview(separatorView)
        imageView.addSubview(noticeView)
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = Notices.noticeMain
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var noticeView: UIView = {
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 327, height: 250)
        view.backgroundColor = .white
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
        label.font = Typography.smallText.font
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var noticeContent: UILabel = {
        let label = UILabel()
        label.text = Notices.allNoticeContent
        label.font = Typography.smallText.font
        label.textColor = .black
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 6.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(backgroundImage)
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(systemName: "arrow.backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    func setConstraints() {
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
            
            noticeView.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 17),
            noticeView.leadingAnchor.constraint(equalTo: backgroundImage.leadingAnchor, constant: 24),
            noticeView.trailingAnchor.constraint(equalTo: backgroundImage.trailingAnchor, constant: -24),
            noticeView.widthAnchor.constraint(equalToConstant: 327),
            noticeView.heightAnchor.constraint(equalToConstant: 250),
            
            noticeDate.topAnchor.constraint(equalTo: noticeView.topAnchor, constant: 16),
            noticeDate.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 16),

            noticeContent.topAnchor.constraint(equalTo: noticeView.topAnchor, constant: 50),
            noticeContent.bottomAnchor.constraint(equalTo: noticeView.bottomAnchor, constant: -20),
            noticeContent.leadingAnchor.constraint(equalTo: noticeView.leadingAnchor, constant: 16),
            noticeContent.trailingAnchor.constraint(equalTo: noticeView.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func showPrevious() {
        self.dismiss(animated: false)
    }
}
