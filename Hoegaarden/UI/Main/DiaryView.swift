//
//  Diary.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/08/19.
//

import UIKit

class ClosureButton: UIButton {
    var onClick: (() -> Void)?

    @objc func buttonClicked() {
        onClick?()
    }
}

class DiaryView: UIView {
    
    private var state: DiaryState?
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Typography.preText.font
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var contentLabel: UILabel = {
        let label = UILabel()
        label.text = MyYesterday.contentLabel
        label.textColor = .black
        label.font = Typography.body2.font
        label.numberOfLines = 0
        label.setLineSpacing(lineSpacing: 6.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var heartButton: ClosureButton = {
        let button = ClosureButton()
        let image = UIImage(named: "heart")
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private var moreButton: ClosureButton = {
        let button = ClosureButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [heartButton, moreButton])
        view.spacing = 15
        view.axis = .horizontal
        view.distribution = .fill
        view.alignment = .fill
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViews() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(dateLabel)
        self.addSubview(contentLabel)
        self.addSubview(buttonStackView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            
            contentLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor, constant: 30),
            contentLabel.bottomAnchor.constraint(equalTo: heartButton.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24),
            
            buttonStackView.bottomAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 50),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -30),
        ])
    }
    
    override func layoutSubviews() {
        setBackground(backgroundColor: state?.backgroundColor)
    }
    
    private func setBackground(backgroundColor: BackgroundColor?) {
        let layer = backgroundColor?.backgroundLayer
        if let layer {
            if self.bounds.width == 0 && self.bounds.height == 0 {
                return
            }
            
            print("bounds \(self.bounds) \(self.bounds.width) \(self.bounds.height)")
            layer.locations = [0.0 , 1.0]
            layer.frame = self.bounds
            
            self.layer.insertSublayer(layer, at: 0)
        }
    }
    
    func setState(diaryState: DiaryState,
                  onClickLike: ClosureButton,
                  onClickMore: ClosureButton,
                  contentView: () -> Void) {
        state = diaryState
        
        
        if case .blueGradient = diaryState.backgroundColor {
        }
        
        if case .lightGrayGradientWithStroke = diaryState.backgroundColor {
            self.layer.borderWidth = 1
            self.layer.borderColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 1).cgColor
        }
        
        setBackground(backgroundColor: diaryState.backgroundColor)
        
        dateLabel.isHidden = diaryState.dateLabel.isEmpty
        dateLabel.text = diaryState.dateLabel
        
        contentLabel.text = diaryState.contentLabel
        
        heartButton.isHidden = diaryState.heartButtonState == nil
        heartButton.isEnabled = diaryState.heartButtonState?.isEnabled == true
        heartButton.setImage(diaryState.heartButtonState?.heartButton, for: .normal)
        
        heartButton = onClickLike
        moreButton = onClickMore
        
        heartButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
        moreButton.addTarget(self, action: #selector(buttonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func buttonClicked(_ sender: ClosureButton) {
        // 버튼이 클릭되었을 때의 처리를 여기에 추가합니다.
        if sender == heartButton {
            print("Heart 버튼이 눌렸습니다.")
        } else if sender == moreButton {
            print("More 버튼이 눌렸습니다.")
        }
    }
}
