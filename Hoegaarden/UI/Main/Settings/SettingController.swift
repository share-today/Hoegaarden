//
//  SettingController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/24.
//

import UIKit
import Alamofire

class SettingController: GestureViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "backgroundImage")
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
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
    
    // 시스템 설정 - 알림
    private var systemLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.settingLabel
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var alertLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.alertLabel
        label.textColor = .black
        label.font = Typography.body2.font
        return label
    }()
    
    private var alertControlSwitch: UISwitch = {
        let alertSwitch: UISwitch = UISwitch()
        alertSwitch.onTintColor = .black
        alertSwitch.tintColor = .lightGray
        alertSwitch.thumbTintColor = .white
        alertSwitch.isOn = true
        alertSwitch.layer.cornerRadius = 16
        return alertSwitch
    }()
    
    private lazy var alertStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [alertLabel, alertControlSwitch])
        stview.spacing = 200
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    // 고객센터 - 의견 보내기, FAQ, 응원하기
    private var csLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.csLabel
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var commentButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.commentLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var faqButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.faqLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var cheerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.cheerLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // 앱 정보 - 이용 약관, 개인정보 처리 방침, 오픈소스 라이센스
    private var appInfoLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.appInfoLabel
        label.textColor = .black
        label.font = Typography.subtitle2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tosButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.tosLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var privacyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.privacyLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var openButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.openLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var appVersionLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.appVersionLabel
        label.textColor = .black
        label.font = Typography.body2.font
        return label
    }()
    
    private var versionLabel: UILabel = {
        let label = UILabel()
        label.text = Settings.appVersion
        label.textColor = .lightGray
        label.font = Typography.body2.font
        return label
    }()
    
    private lazy var appVersionStackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [appVersionLabel, versionLabel])
        stview.spacing = 100
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    private var logoutButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.logoutLabel, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var unregisterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle(Settings.unregisterLabel, for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Typography.body2.font
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setupAddTarget()
        configureContentViewHeight()
        configureNavigationBarButton()
        setSeparatorView()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(backgroundImage)
        backgroundImage.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(systemLabel)
        contentView.addSubview(alertStackView)
        contentView.addSubview(csLabel)
        contentView.addSubview(commentButton)
        contentView.addSubview(faqButton)
        contentView.addSubview(cheerButton)
        contentView.addSubview(appInfoLabel)
        contentView.addSubview(tosButton)
        contentView.addSubview(privacyButton)
        contentView.addSubview(openButton)
        contentView.addSubview(logoutButton)
        contentView.addSubview(unregisterButton)
        contentView.addSubview(appVersionStackView)
    }
    
    private func setupAddTarget() {
        alertControlSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .touchUpInside)
        commentButton.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        tosButton.addTarget(self, action: #selector(tosButtonTapped), for: .touchUpInside)
        privacyButton.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
        openButton.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        unregisterButton.addTarget(self, action: #selector(unregisterButtonTapped), for: .touchUpInside)
    }
    
    private func configureContentViewHeight() {
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: view.heightAnchor, constant: 200)
        contentViewHeight.priority = .defaultHigh
        contentViewHeight.isActive = true
    }
    
    private func configureNavigationBarButton() {
        let image = UIImage(named: "menu")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: image, style: .done,
            target: self, action: #selector(showSideMenu))
    }
    
    private func setSeparatorView() {
        let separatorPositions = [10, 160, 390]
        for i in 0..<separatorPositions.count {
            let separatorView = UIView()
            separatorView.backgroundColor = UIColor(red: 0.169, green: 0.169, blue: 0.169, alpha: 1)
            separatorView.translatesAutoresizingMaskIntoConstraints = false
            contentView.addSubview(separatorView)
            
            NSLayoutConstraint.activate([
                separatorView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: CGFloat(separatorPositions[i])),
                separatorView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
                separatorView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                separatorView.heightAnchor.constraint(equalToConstant: 1)
            ])
        }
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            systemLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 60),
            systemLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            alertStackView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 40),
            alertStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            alertStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
            csLabel.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 130),
            csLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            commentButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 40),
            commentButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            faqButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant:  80),
            faqButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            cheerButton.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 120),
            cheerButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            appInfoLabel.topAnchor.constraint(equalTo: csLabel.bottomAnchor, constant: 210),
            appInfoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            tosButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 40),
            tosButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            privacyButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 80),
            privacyButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            openButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 120),
            openButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
                    
            appVersionStackView.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 270),
            appVersionStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            appVersionStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            
            logoutButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 320),
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            unregisterButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 370),
            unregisterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
    }
    
    private func logoutRequest() {
        let url = "https://share-today.site/auth/logout"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            AF.request(url,
                       method: .post,
                       headers: headers)
            .validate()
            .responseJSON { [self] response in
                switch response.result {
                case .success(let value):
                    print("Logout Response JSON: \(value)")
                    
                    let loginVC = LoginViewController()
                    loginVC.modalPresentationStyle = .overFullScreen
                    present(loginVC, animated: true)
                    
                case .failure(let error):
                    print("Logout Error: \(error.localizedDescription)")
                }
            }
        } else {
            print("JWT token not found.")
        }
    }
    
    private func enableAlerts(userId id: Int) {
        let url = "https://share-today.site/user/\(id)/alert"
        
        if let jwtToken = UserDefaults.standard.string(forKey: "UserJWT") {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(jwtToken)"
            ]
            
            AF.request(url,
                       method: .put,
                       headers: headers)
            .validate()
            .responseJSON { [self] response in
                switch response.result {
                case .success(let value):
                    print("Alert Response JSON: \(value)")
        
                case .failure(let error):
                    print("Alert Error: \(error.localizedDescription)")
                }
            }
        } else {
            print("JWT token not found.")
        }
    }
    
    @objc private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            enableAlerts(userId: 2)
        } else {
        }
    }
    
    @objc private func commentButtonTapped() {
        let commentVC = CommentViewController()
        commentVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: commentVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func tosButtonTapped() {
        let tosVC = TOSViewController()
        tosVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: tosVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func privacyButtonTapped() {
        let privacyVC = PrivacyViewController()
        privacyVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: privacyVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func openButtonTapped() {
        let openVC = OpenViewController()
        openVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: openVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func logoutButtonTapped() {
        self.alert.showAlert("",
                             subTitle: AlertMessage.logoutMessage,
                             style: AlertStyle.customImage(imageFile: "warning"),
                             buttonTitle: AlertMessage.cancelButton,
                             buttonColor: .white,
                             otherButtonTitle: AlertMessage.logoutButton,
                             otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                logoutRequest()
            }
        }
    }
    
    @objc private func unregisterButtonTapped() {
        let unregisterVC = UnregisterViewController()
        unregisterVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: unregisterVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }

    @objc private func showSideMenu() {
        let side = SettingSide()
        side.modalPresentationStyle = .overFullScreen
        present(side, animated: false, completion: nil)
    }
}
