//
//  SettingController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/01/24.
//

import UIKit
import Alamofire

class SettingController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    
    private lazy var backgroundImage: UIImageView = {
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
    
    private var systemLabel: UILabel = {
        let label = UILabel()
        label.text = "시스템 설정"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var alertLabel: UILabel = {
        let label = UILabel()
        label.text = "알림"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var alertControlSwitch: UISwitch = {
        let alertSwitch: UISwitch = UISwitch()
        alertSwitch.onTintColor = .black
        alertSwitch.tintColor = .lightGray
        alertSwitch.thumbTintColor = .white
        alertSwitch.isOn = true
        alertSwitch.layer.cornerRadius = 16
        alertSwitch.translatesAutoresizingMaskIntoConstraints = false
        alertSwitch.addTarget(self, action: #selector(switchValueChanged(_:)), for: .touchUpInside)
        return alertSwitch
    }()
    
    private lazy var stackView: UIStackView = {
        let stview = UIStackView(arrangedSubviews: [alertLabel, alertControlSwitch])
        stview.spacing = 200
        stview.axis = .horizontal
        stview.distribution = .fill
        stview.alignment = .fill
        stview.translatesAutoresizingMaskIntoConstraints = false
        return stview
    }()
    
    private var csLabel: UILabel = {
        let label = UILabel()
        label.text = "고객 센터"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("의견 보내기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.addTarget(self, action: #selector(commentButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var faqButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("FAQ", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var cheerButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("응원하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var appInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 정보"
        label.textColor = .black
        label.font = Font.bold.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var tosButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("이용 약관", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tosButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var privacyButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("개인정보 처리 방침", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(privacyButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var openButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("오픈소스 라이센스", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var appVersionLabel: UILabel = {
        let label = UILabel()
        label.text = "앱 버전"
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var versionLabel: UILabel = {
        let label = UILabel()
        label.text = "v 1.0"
        label.textColor = .lightGray
        label.font = Font.air.of(size: 16)
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
        let button = UIButton(type: .custom)
        button.setTitle("로그아웃", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var unregisterButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("회원 탈퇴", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(unregisterButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
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
        contentView.addSubview(stackView)
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
        contentView.addSubview(appVersionLabel)
        contentView.addSubview(versionLabel)
        contentView.addSubview(appStackView)
    }
    
    private func enableAlerts() {
        let response = """
          {
              "result": true,
              "message": "알림 설정 완료"
          }
          """
        
        if let jsonData = response.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: Any],
            let result = json["result"] as? Bool,
            let message = json["message"] as? String {
             if result {
                 print(message)
             } else {
                 print("알림 설정 실패")
             }
         } else {
             print("오류")
         }
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
            
            stackView.topAnchor.constraint(equalTo: systemLabel.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -40),
            
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
            
            appStackView.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 270),
            appStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            appStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -1),
            
            logoutButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 320),
            logoutButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36),
            
            unregisterButton.topAnchor.constraint(equalTo: appInfoLabel.bottomAnchor, constant: 370),
            unregisterButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 36)
        ])
    }
    
    @objc func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            // 알림 설정을 실행합니다.
            enableAlerts()
        } else {
            // 알림 해제를 실행합니다.
//            disableNotifications()
        }
    }
    
    @objc private func commentButtonTapped() {
        let commentVC = CommentView()
        commentVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: commentVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func tosButtonTapped() {
        let tosVC = TOSView()
        tosVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: tosVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func privacyButtonTapped() {
        let privacyVC = PrivacyView()
        privacyVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: privacyVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func openButtonTapped() {
        let openVC = OpenView()
        openVC.modalPresentationStyle = .fullScreen
        let nav = UINavigationController(rootViewController: openVC)
        nav.modalPresentationStyle = .overFullScreen
        present(nav, animated: true, completion: nil)
    }
    
    @objc private func logoutButtonTapped() {
        self.alert.showAlert("", subTitle: "로그아웃 하겠어요?",
                             style: AlertStyle.customImage(imageFile: "warning"),
                             buttonTitle: "취소", buttonColor: .white,
                             otherButtonTitle: "로그아웃", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                AF.request("https://share-today.site/auth/logout", method: .post, headers: ["Authorization": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MiwiaWF0IjoxNjgzOTc1MTkyLCJpc3MiOiJzaGFyZS10b2RheSJ9._VamLAjuGOTeH7iQJ9C8okZAgbPuEAJ12IJ0NSbbxb4"])
                    .validate()
                    .responseJSON { response in
                        switch response.result {
                        case .success(let value):
                            print("Response JSON: \(value)")
                            // 토큰 삭제
                            UserDefaults.standard.removeObject(forKey: "jwt")
                        case .failure(let error):
                            print("Error: \(error.localizedDescription)")
                        }
                    }

                
                let loginVC = LoginViewController()
                loginVC.modalPresentationStyle = .overFullScreen
                self.present(loginVC, animated: true)
            }
        }
    }
    
    @objc private func unregisterButtonTapped() {
        let unregisterVC = UnregisterView()
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
