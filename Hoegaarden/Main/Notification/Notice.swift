//
//  Notice.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/05.
//

import UIKit

class Notice: UIViewController {
    
    private lazy var noticeLabel: UILabel = {
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
    
    private lazy var noticeAlertView: UIView = {
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
    
    private lazy var noticeDate: UILabel = {
        let label = UILabel()
        label.text = "00월 00일"
        label.font = Font.air.of(size: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var noticeContent: UILabel = {
        let label = UILabel()
        label.text = "📢 좋은 소식이 있어요! 클릭하여 확인해 주세요!\n\n안녕하세요. 여러분 하루공유가 정말 좋은 소식을\n들려주려 합니다. OO 이벤트를 통해 좀 더 여러분\n의 하루를 풍요롭게 하려 합니다.\n\n참여 방법은 하단에 더욱 자세히 나와있으니 참고\n부탁드려요. ;)"
        label.font = Font.air.of(size: 14)
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
        view.addSubview(noticeLabel)
        view.addSubview(lineView)
        view.addSubview(noticeAlertView)
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
            noticeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            noticeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 36),
            
            lineView.topAnchor.constraint(equalTo: noticeLabel.bottomAnchor, constant: 12),
            lineView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            lineView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            lineView.widthAnchor.constraint(equalToConstant: 351),
            lineView.heightAnchor.constraint(equalToConstant: 1),
            
            noticeAlertView.topAnchor.constraint(equalTo: lineView.topAnchor, constant: 17),
            noticeAlertView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            noticeAlertView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            noticeAlertView.widthAnchor.constraint(equalToConstant: 327),
            noticeAlertView.heightAnchor.constraint(equalToConstant: 250),
            
            noticeDate.topAnchor.constraint(equalTo: noticeAlertView.topAnchor, constant: 16),
            noticeDate.leadingAnchor.constraint(equalTo: noticeAlertView.leadingAnchor, constant: 16),

            noticeContent.topAnchor.constraint(equalTo: noticeAlertView.topAnchor, constant: 50),
            noticeContent.bottomAnchor.constraint(equalTo: noticeAlertView.bottomAnchor, constant: -20),
            noticeContent.leadingAnchor.constraint(equalTo: noticeAlertView.leadingAnchor, constant: 16),
            noticeContent.trailingAnchor.constraint(equalTo: noticeAlertView.trailingAnchor, constant: -16)
        ])
    }
    
    @objc func showPrevious() {
        self.dismiss(animated: false)
    }
}

extension UILabel {

    // Pass value for any one of both parameters and see result
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

        guard let labelText = self.text else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple

        let attributedString: NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }

        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                      value: paragraphStyle,
                                      range: NSMakeRange(0, attributedString.length))

        self.attributedText = attributedString
    }
}
