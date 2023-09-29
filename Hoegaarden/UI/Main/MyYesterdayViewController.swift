//
//  MyYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/28.
//

import UIKit

class MyYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alertUtils = AlertUtils()

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
        return actionSheet
    }()
    
    private lazy var reportAndDeleteActionSheet: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.reportButton)
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
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
        setMoreButtonActions()
        setCollectionView()
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
                                    likeButtonState: nil,
                                    backgroundColor: .blueGradient)
        
        diaryView.setState(
            diaryState: diaryState,
            onClickLike: {
                print("like")
            },
            onClickMore: { [self] in
                deleteActionSheet.modalPresentationStyle = .overFullScreen
                present(deleteActionSheet, animated: false)
            },
            contentView: {

            }
        )
    }
    
    private func setMoreButtonActions() {
        deleteActionSheet.button.addAction(UIAction(handler: { [self] _ in
            alertUtils.showAlert(viewController: self,
                                 message: AlertMessage.deleteMessage,
                                 imageFile: "trash",
                                 otherButtonTitle: AlertMessage.deleteButton) {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }), for: .touchUpInside)
        
        reportAndDeleteActionSheet.mainButton.addAction(UIAction(handler: { [self] _ in
            alertUtils.showAlert(viewController: self,
                                 message: AlertMessage.reportMessage,
                                 imageFile: "frown",
                                 otherButtonTitle: AlertMessage.reportButton) {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "check-circle"),
                                message: ToastMessage.reportToast)
            }
        }), for: .touchUpInside)
        
        reportAndDeleteActionSheet.secondButton.addAction(UIAction(handler: { [self] _ in
            alertUtils.showAlert(viewController: self,
                                 message: AlertMessage.commentDeleteMessage,
                                 imageFile: "trash",
                                 otherButtonTitle: AlertMessage.deleteButton) {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                message: ToastMessage.trashToast)
            }
        }), for: .touchUpInside)
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyYesterdayCell.self, forCellWithReuseIdentifier: "MyYesterdayCell")
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
}


extension MyYesterdayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
