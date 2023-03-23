//
//  UnregisterView.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/13.
//

import UIKit

class UnregisterView: UIViewController {
    
    private let alert = SweetAlert()
    
    private var mainLabel: UILabel = {
        let label = UILabel()
        label.text = "회원 탈퇴"
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
        label.text = " 회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.\n\n· 사용하고 계신 이메일 로그인 정보는 탈퇴할 경우 하루 동안 재가입이 불가능합니다.\n\n· 탈퇴 후 회원 정보 및 서비스 이용기록은 모두 삭제되어 복구가 불가능합니다.\n· 삭제된 데이터는 복구되지 않습니다. 삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업해주세요.\n· 삭제정보: SNS 로그인 정보, 닉네임, 나의 그날 게시물, 다른 사람의 게시물에 반응한 좋아요 및 코멘트 기록"
        label.numberOfLines = 0
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.setLineSpacing(lineSpacing: 6.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var checkBoxButton: UIButton = {
        let button = UIButton(type: .custom)
        let image = UIImage(named: "checkBox_empty")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkBoxButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private var checkLabel: UILabel = {
        let label = UILabel()
        label.text = "안내 사항을 모두 확인했으며 이에 동의합니다."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        configureNavigationBarButton()
        setConstraints()
        completion(isOn: false)
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(mainLabel)
        view.addSubview(lineView)
        view.addSubview(contentLabel)
        view.addSubview(checkBoxButton)
        view.addSubview(checkLabel)
    }
    
    private func configureNavigationBarButton() {
        let leftImage = UIImage(named: "backward")?.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightImage = UIImage(named: "unregister_gray")?.withTintColor(.lightGray, renderingMode: .alwaysOriginal)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            image: leftImage, style: .done,
            target: self, action: #selector(showPrevious))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: rightImage, style: .done,
            target: self, action: #selector(showUnregisterAlert))
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 140),
            mainLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
        
            lineView.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1),
        
            contentLabel.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 20),
            contentLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            
            checkBoxButton.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 40),
            checkBoxButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            
            checkLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 42),
            checkLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 10)
        ])
    }
    
    private func completion(isOn: Bool) {
        switch isOn {
        case true:
            navigationItem.rightBarButtonItem?.isEnabled = true
            navigationItem.rightBarButtonItem?.tintColor = .black
        case false:
            navigationItem.rightBarButtonItem?.isEnabled = false
            navigationItem.rightBarButtonItem?.image = UIImage(named: "unregister_gray")
        }
    }
    
    @objc private func checkBoxButtonTapped() {
        if checkBoxButton.isSelected == true {
            checkBoxButton.isSelected = false
            checkBoxButton.setImage(UIImage(named: "checkBox_empty"), for: .normal)
            
            completion(isOn: false)
        } else {
            checkBoxButton.isSelected = true
            checkBoxButton.setImage(UIImage(named: "checkBox"), for: .normal)
            
            completion(isOn: true)
        }
    }
    
    @objc private func showPrevious() {
        dismiss(animated: false)
    }
    
    @objc private func showUnregisterAlert() {
        alert.showAlert("", subTitle: "정말 탈퇴하겠어요?",
                        style: AlertStyle.customImage(imageFile: "warning"),
                        buttonTitle: "취소", buttonColor: .white,
                        otherButtonTitle: "탈퇴", otherButtonColor: .black) { (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                let controller = LoginViewController()
                controller.modalPresentationStyle = .fullScreen
                self.present(controller, animated: true, completion: nil)
            }
        }
    }
}
