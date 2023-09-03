//
//  PrivacyViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/31.
//

import UIKit

class PrivacyViewController: GestureViewController {
    
    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private var contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.privacyMain
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.privacyContent
        label.numberOfLines = 0
        label.textColor = .black
        label.font = Typography.body2.font
        label.setLineSpacing(lineSpacing: 6.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        configureNavigationBarButton()
        particularLabel()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(mainLabel)
        contentView.addSubview(separatorView)
        contentView.addSubview(contentLabel)
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
    }
    
    private func particularLabel() {
        let fullText = contentLabel.text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let font = Typography.subtitle2.font
        
        let keywords = ["제 1조 개인정보의 수집 및 이용에 관한 안내"]
        for keyword in keywords {
            let range = (fullText as NSString).range(of: keyword)
            attributedString.addAttribute(.font, value: font, range: range)
        }
        contentLabel.attributedText = attributedString
        contentLabel.setLineSpacing(lineSpacing: 6.0)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            mainLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
        
            separatorView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12),
            separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            separatorView.heightAnchor.constraint(equalToConstant: 1),
        
            contentLabel.topAnchor.constraint(equalTo: separatorView.topAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
    
    @objc private func showPrevious() {
        dismiss(animated: false)
    }
}
