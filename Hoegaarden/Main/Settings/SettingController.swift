//
//  SettingController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/24.
//

import UIKit

class SettingController: UIViewController {

    var delegate: HomeControllerDelegate?
    
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
    
    private var systemLabel: UILabel = {
        let label = UILabel()
        label.text = "시스템 설정"
        label.textColor = .black
        label.font = UIFont(name: "Cafe24Ssurround", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var alertLabel: UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .black
        label.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var controlSwitch: UISwitch = {
        let cs: UISwitch = UISwitch()
        cs.onTintColor = .black
        cs.tintColor = .lightGray
        cs.thumbTintColor = .white
        cs.isOn = true
        cs.layer.cornerRadius = 16
        cs.translatesAutoresizingMaskIntoConstraints = false
        return cs
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [alertLabel, controlSwitch])
        stview.spacing = 200
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    private var csLabel: UILabel = {
        let csl = UILabel()
        csl.text = "고객 센터"
        csl.textColor = .black
        csl.font = UIFont(name: "Cafe24Ssurround", size: 16)
        csl.translatesAutoresizingMaskIntoConstraints = false
        return csl
    }()
    
    private lazy var secondView: UIView = {
        let sv = UIView()
        sv.backgroundColor = .black
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var commentButton: UIButton = {
        let cb = UIButton(type: .custom)
        cb.setTitle("의견 보내기", for: .normal)
        cb.setTitleColor(.black, for: .normal)
        cb.backgroundColor = .clear
        cb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        cb.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    lazy var faqButton: UIButton = {
        let fb = UIButton(type: .custom)
        fb.setTitle("FAQ", for: .normal)
        fb.setTitleColor(.black, for: .normal)
        fb.backgroundColor = .clear
        fb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        fb.translatesAutoresizingMaskIntoConstraints = false
        return fb
    }()
    
    lazy var cheerButton: UIButton = {
        let cb = UIButton(type: .custom)
        cb.setTitle("응원하기", for: .normal)
        cb.setTitleColor(.black, for: .normal)
        cb.backgroundColor = .clear
        cb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        cb.translatesAutoresizingMaskIntoConstraints = false
        return cb
    }()
    
    private var appInfoLabel: UILabel = {
        let il = UILabel()
        il.text = "앱 정보"
        il.textColor = .black
        il.font = UIFont(name: "Cafe24Ssurround", size: 16)
        il.translatesAutoresizingMaskIntoConstraints = false
        return il
    }()
    
    private lazy var thirdView: UIView = {
        let tv = UIView()
        tv.backgroundColor = .black
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()
    
    lazy var tosButton: UIButton = {
        let tb = UIButton(type: .custom)
        tb.setTitle("이용 약관", for: .normal)
        tb.setTitleColor(.black, for: .normal)
        tb.backgroundColor = .clear
        tb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.addTarget(self, action: #selector(tosButtonTapped), for: .touchUpInside)
        return tb
    }()
    
    lazy var privacyButton: UIButton = {
        let pb = UIButton(type: .custom)
        pb.setTitle("개인정보 처리 방침", for: .normal)
        pb.setTitleColor(.black, for: .normal)
        pb.backgroundColor = .clear
        pb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        pb.translatesAutoresizingMaskIntoConstraints = false
        pb.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
        return pb
    }()
    
    lazy var openButton: UIButton = {
        let ob = UIButton(type: .custom)
        ob.setTitle("오픈소스 라이센스", for: .normal)
        ob.setTitleColor(.black, for: .normal)
        ob.backgroundColor = .clear
        ob.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        ob.translatesAutoresizingMaskIntoConstraints = false
        ob.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        return ob
    }()
    
    private var appVersionLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 버전"
        label.textColor = .black
        label.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var versionLabel: UILabel = {
        let label = UILabel()
        label.text = "v 1.0"
        label.textColor = .lightGray
        label.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var appStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [appVersionLabel, versionLabel])
        stview.spacing = 200
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    lazy var logoutButton: UIButton = {
        let lb = UIButton(type: .custom)
        lb.setTitle("로그아웃", for: .normal)
        lb.setTitleColor(.black, for: .normal)
        lb.backgroundColor = .clear
        lb.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    lazy var unregisterButton: UIButton = {
        let ub = UIButton(type: .custom)
        ub.setTitle("회원 탈퇴", for: .normal)
        ub.setTitleColor(.lightGray, for: .normal)
        ub.backgroundColor = .clear
        ub.titleLabel?.font = UIFont(name: "Cafe24SsurroundAir", size: 16)
        ub.translatesAutoresizingMaskIntoConstraints = false
        return ub
    }()
    
    @objc func commentButtonTapped() {
        let commentVC = CommentView()
        commentVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: commentVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc func tosButtonTapped() {
        let tosVC = TOSView()
        tosVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: tosVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc func privacyButtonTapped() {
        let privacyVC = PrivacyView()
        privacyVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: privacyVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc func openButtonTapped() {
        let openVC = OpenView()
        openVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: openVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setConstraints()
        configureContentViewHeight()
        configureNavigationBarButton()
    }
    
    func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    func addViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(systemLabel)
        contentView.addSubview(firstView)
        contentView.addSubview(stackView)
        contentView.addSubview(csLabel)
        contentView.addSubview(secondView)
        contentView.addSubview(commentButton)
        contentView.addSubview(faqButton)
        contentView.addSubview(cheerButton)
        contentView.addSubview(appInfoLabel)
        contentView.addSubview(thirdView)
        contentView.addSubview(tosButton)
        contentView.addSubview(privacyButton)
        contentView.addSubview(openButton)
        contentView.addSubview(logoutButton)
        contentView.addSubview(unregisterButton)
        contentView.addSubview(appVersionLabel)
        contentView.addSubview(versionLabel)
        contentView.addSubview(appStackView)
    }
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            systemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 130),
            systemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            firstView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 12),
            firstView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            firstView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            firstView.widthAnchor.constraint(equalToConstant: 351),
            firstView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            csLabel.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 130),
            csLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            secondView.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 12),
            secondView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            secondView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            secondView.widthAnchor.constraint(equalToConstant: 351),
            secondView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            commentButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 40),
            commentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            faqButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant:  80),
            faqButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            cheerButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 120),
            cheerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            appInfoLabel.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 210),
            appInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            thirdView.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 12),
            thirdView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            thirdView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            thirdView.widthAnchor.constraint(equalToConstant: 351),
            thirdView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate([
            tosButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 40),
            tosButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            privacyButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 80),
            privacyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            openButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 120),
            openButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            appStackView.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 270),
            appStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            appStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40)
        ])
        
        NSLayoutConstraint.activate([
            logoutButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 320),
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
        
        NSLayoutConstraint.activate([
            unregisterButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 370),
            unregisterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
    }
    
    func configureContentViewHeight() {
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor)
        contentViewHeight.priority = .defaultHigh
        contentViewHeight.isActive = true
    }
    
    func configureNavigationBarButton() {
        let image = UIImage(named: "menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showSideMenu))
    }

    @objc func showSideMenu() {
        delegate?.handleMenuToggle(forMenuOptions: nil)
    }
}
