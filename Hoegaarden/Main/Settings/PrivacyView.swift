//
//  PrivacyView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/31.
//

import UIKit

class PrivacyView: UIViewController {
    
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
    
    private var privacyLabel: UILabel = {
        let label = UILabel()
        label.text = "개인정보 처리 방침"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "하루공유는 고객의 개인정보를 소중히 다루고 관련 법령을 준수하고 있습니다. 회사는 개인정보보호법 등 관련 법령에 따라 개인정보처리방침을 수립한 뒤 홈페이지에 공개하여 고객이 언제나 용이하게 열람할 수 있도록 하고 있습니다.\n\n제 1조 개인정보의 수집 및 이용에 관한 안내\n회사는 아래와 같이 제공하는 서비스에 따라 개인정보의 수집목적, 항목, 보유 및 이용기간을 달리하여 서비스 제공을 위하여 필요한 최소한의 개인정보를 수집하고 있습니다."
        label.numberOfLines = 0
        label.textColor = .black
        label.font = Font.air.of(size: 16)
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
        contentView.addSubview(privacyLabel)
        contentView.addSubview(lineView)
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
        let font = Font.bold.of(size: 16)
        
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
            
            privacyLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            privacyLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
        
            lineView.topAnchor.constraint(equalTo: privacyLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        
            contentLabel.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24)
        ])
    }
    
    @objc private func showPrevious() {
        dismiss(animated: false)
    }
}
