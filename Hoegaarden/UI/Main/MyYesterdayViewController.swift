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

    private let diaryView: DiaryView = DiaryView()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var deleteActionSheet: DeleteAlertAction = {
        let actionSheet = DeleteAlertAction()
        actionSheet.setButtonTitle(AlertMessage.deleteButton)
        actionSheet.button.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
        return actionSheet
    }()
    
    private lazy var reportAndDeleteActionSheet: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.reportButton)
        actionSheet.mainButton.addTarget(self, action: #selector(commentReportButtonAction), for: .touchUpInside)
        
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        actionSheet.secondButton.addTarget(self, action: #selector(commentDeleteButtonAction), for: .touchUpInside)
        
        return actionSheet
    }()
    
    private var dataArray: [commentData] = [
        commentData(content: "우아앙"),
        commentData(content: "뿌아앙"),
        commentData(content: "이이잉"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        addViews()
        setViews()
        setCollectionView()
        setupAddTarget()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(diaryView)
        view.addSubview(collectionView)
    }
    
    private func setViews() {
        let diaryState = DiaryState(id: "1",
                                    dateLabel: "23년 08월 21일",
                                    contentLabel: "이이이이이이이",
                                    likeButtonState: LikeButtonState(isLike: true, isEnabled: true),
                                    backgroundColor: .blueGradient)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: {
                print("like")
            },
            onClickMore: {
                print("more")
            },
            contentView: {

            }
        )
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyYesterdayCell.self, forCellWithReuseIdentifier: "MyYesterdayCell")
    }
    
    private func setupAddTarget() {
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            diaryView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            diaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            diaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            diaryView.heightAnchor.constraint(lessThanOrEqualToConstant: 150),
            
            collectionView.topAnchor.constraint(equalTo: diaryView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = MyYesterday.emptyState
        label.textColor = .black
        label.font = Typography.body2.font
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc private func showMoreButton() {
        deleteActionSheet.modalPresentationStyle = .overFullScreen
        self.present(deleteActionSheet, animated: false)
    }
    
    @objc private func deleteButton() {
        alert.showAlert("",
                        subTitle: AlertMessage.deleteMessage,
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
    
    @objc private func deleteButtonAction() {
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
    
    @objc private func commentReportButtonAction() {
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
    
    @objc private func commentDeleteButtonAction() {
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
}


extension MyYesterdayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyYesterdayCell", for: indexPath) as! MyYesterdayCell
        
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
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
