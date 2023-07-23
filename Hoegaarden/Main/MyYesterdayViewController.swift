//
//  MyYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit

class MyYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    private let deleteAlertAction = DeleteAlertAction()
    private let reportAndDeleteAlertAction = ReportAndDeleteAlertAction()
    
    
    private lazy var myYesterdayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(moreButton)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = MyYesterday.yesterdayDate
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var contentLabel: UILabel = {
        let label = UILabel()
        label.text = "기분 꿀꿀하다. 너무 힘들다."
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    private lazy var reportAndDeleteActionSheet: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.reportButton)
        actionSheet.mainButton.addTarget(self, action: #selector(commentReportButtonTapped), for: .touchUpInside)
        
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        actionSheet.secondButton.addTarget(self, action: #selector(commentDeleteButtonTapped), for: .touchUpInside)
        
        return actionSheet
    }()
    
    private var dataArray: [MyYesterdayData] = [
        MyYesterdayData(content: "우아앙"),
        MyYesterdayData(content: "뿌아앙"),
        MyYesterdayData(content: "이이잉"),
    ]
    
    private let data = [
        "Item 1",
        "Item 2",
        "Item 3"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setGradientLayer()
        setCollectionView()
        setupAddTarget()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(myYesterdayView)
        view.addSubview(collectionView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.25, y: 0.5)
        layer.endPoint = CGPoint(x: 0.75, y: 0.5)
        layer.locations = [0, 1]
        layer.frame = myYesterdayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myYesterdayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyYesterdayCell.self, forCellWithReuseIdentifier: "MyYesterdayCell")
    }
    
    private func setupAddTarget() {
        moreButton.addTarget(self, action: #selector(moreButtonTapped), for: .touchUpInside)
        deleteAlertAction.deleteButton.addTarget(self, action: #selector(deleteTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.reportButton.addTarget(self, action: #selector(commentReportTapped), for: .touchUpInside)
        reportAndDeleteAlertAction.deleteButton.addTarget(self, action: #selector(commentDeleteTapped), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myYesterdayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myYesterdayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myYesterdayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myYesterdayView.heightAnchor.constraint(equalToConstant: 242),
            
            dateLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            
            contentLabel.topAnchor.constraint(equalTo: myYesterdayView.topAnchor, constant: 68),
            contentLabel.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -68),
            contentLabel.leadingAnchor.constraint(equalTo: myYesterdayView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -24),
            
            moreButton.bottomAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: -24),
            moreButton.trailingAnchor.constraint(equalTo: myYesterdayView.trailingAnchor, constant: -30),
            
            collectionView.topAnchor.constraint(equalTo: myYesterdayView.bottomAnchor, constant: 30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = MyYesterday.emptyState
        label.textColor = .black
        label.font = Font.air.of(size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func moreButtonTapped() {
        let actionsheetVC = deleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func deleteTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.myYesterdayDeleteMessage,
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.deleteButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false, completion: nil)
                
                toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                message: ToastMessage.trashToast)
            }
        }
    }
    
    @objc private func commentMoreButtonTapped(_ sender: UIButton) {
        let actionsheetVC = reportAndDeleteAlertAction
        actionsheetVC.modalPresentationStyle = .overFullScreen
        self.present(actionsheetVC, animated: false)
    }
    
    @objc private func commentReportTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.reportMessage,
                        style: AlertStyle.customImage(imageFile: "frown"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.reportButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false, completion: nil)
                toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                message: ToastMessage.reportToast)
            }
        }
    }
    
    @objc private func commentDeleteTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.commentDeleteMessage,
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.deleteButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false, completion: nil)
                toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                message: ToastMessage.trashToast)
            }
        }
    }
    
    @objc private func commentReportButtonTapped() {
        
    }
    
    @objc private func commentDeleteButtonTapped() {
        
    }

}


extension MyYesterdayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyYesterdayCell", for: indexPath) as! MyYesterdayCell
        
        let data = dataArray[indexPath.item]
        cell.commentContent.text = data.content
        
        cell.commentMoreButtonAction = { [weak self] in
            if let actionSheet = self?.reportAndDeleteActionSheet {
                actionSheet.modalPresentationStyle = .overFullScreen
                self?.present(actionSheet, animated: false)
            }
        }
                
        
        return cell
    }
}

extension MyYesterdayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width - 10
        return CGSize(width: cellWidth, height: 132)
    }
}
