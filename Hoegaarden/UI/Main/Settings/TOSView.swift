//
//  TOSView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/26.
//

import UIKit

class TOSView: UIViewController {
    
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
        label.text = Settings.tosLabel
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
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
        label.text = Settings.tosContent
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
        particularLabel()
        configureContentViewHeight()
        configureNavigationBarButton()
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
    
    private func particularLabel() {
        let fullText = contentLabel.text ?? ""
        let attributedString = NSMutableAttributedString(string: fullText)
        let font = Font.bold.of(size: 16)
        
        let keywords = ["제 1장 총칙", "제 1조 목적", "제 2조 정의", "제 3조 약관의 게시와 개정", "제 2장 회원 가입", "제 4조 회원 가입",
                        "제 5조 회원정보의 변경", "제 6조“회원”의 “아이디” 및 “비밀번호”의 관리에 대한 의무", "제 7조 “회원”에 대한 통지", "제 8조 회원탈퇴 및 자격 상실 등",
                        "제3장 콘텐츠이용계약", "제 9조 “콘텐츠”의 내용 등의 게시", "제 10조 이용계약의 성립 등", "제 11조 미성년자 이용계약에 관한 특칙", "제 12조 수신확인통지·이용신청 변경 및 취소",
                        "제 13조 “회사”의 의무", "제 14조 “이용자”의 의무", "제 15조 지급방법", "제 16조 콘텐츠서비스의 제공 및 중단", "제 17조 콘텐츠서비스의 변경", "제 18조 정보의 제공 및 광고의 게재",
                        "제 19조 게시물의 삭제", "제 20조 저작권 등의 귀속", "제 21조 개인정보보호", "제4장 콘텐츠이용계약의 청약철회, 계약해제·해지 및 이용중단, 이용제한 등", "제 22조 “이용자”의 청약철회와 계약해제·해지",
                        "제 23조 “이용자”의 청약철회와 계약해제·해지의 효과", "제 24조 회사의 계약해제·해지 및 이용제한", "제 25조 회사의 계약해제·해지의 효과","제 26조 면책조항", "제 27조 분쟁의 해결"]
        for keyword in keywords {
            let range = (fullText as NSString).range(of: keyword)
            attributedString.addAttribute(.font, value: font, range: range)
        }
        contentLabel.attributedText = attributedString
        contentLabel.setLineSpacing(lineSpacing: 6.0)
    }
    
    private func configureContentViewHeight() {
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, constant: 12000)
        contentViewHeight.priority = .defaultHigh
        contentViewHeight.isActive = true
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showPrevious))
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
