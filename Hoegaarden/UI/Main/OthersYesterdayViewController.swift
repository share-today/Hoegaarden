//
//  OthersYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/27.
//

import UIKit

class OthersYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alertUtils = AlertUtils()
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    private lazy var reportAndDeleteActionSheet: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.reportButton)
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        return actionSheet
    }()
    
    private lazy var modifyAndDeleteAlertAction: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.modifyButton)
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        return actionSheet
    }()

    private var dataArray: [OthersData] = [
        OthersData(date: "23년 03월 03일", content: "우아앙"),
        OthersData(date: "23년 03월 03일", content: "뿌아앙"),
        OthersData(date: "23년 03월 03일", content: "이이잉"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        setMoreButtonActions()
        setCollectionView()
        addTapToDismissKeyboardGesture()
    }

    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setMoreButtonActions() {
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
        
        modifyAndDeleteAlertAction.mainButton.addAction(UIAction(handler: { [self] _ in
            alertUtils.showAlert(viewController: self,
                                 message: AlertMessage.modifyMessage,
                                 imageFile: "modify",
                                 otherButtonTitle: AlertMessage.modifyButton) {
            }
        }), for: .touchUpInside)
        
        modifyAndDeleteAlertAction.secondButton.addAction(UIAction(handler: { [self] _ in
            alertUtils.showAlert(viewController: self,
                                 message: AlertMessage.sendDeleteMessage,
                                 imageFile: "trash",
                                 otherButtonTitle: AlertMessage.deleteButton) {
                self.toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }), for: .touchUpInside)
    }
    
    private func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OthersCell.self, forCellWithReuseIdentifier: "OthersCell")
        
        collectionView.contentInset = UIEdgeInsets(top: 40, left: 0, bottom: 0, right: 0)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 450)
        ])
    }
}

extension OthersYesterdayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OthersCell", for: indexPath) as! OthersCell
            
        cell.moreButtonAction = { [weak self] in
            if let actionSheet = self?.reportAndDeleteActionSheet {
                actionSheet.modalPresentationStyle = .overFullScreen
                self?.present(actionSheet, animated: false)
            }
        }
        
        cell.moreModifyButtonAction = { [weak self] in
            if let actionSheet = self?.modifyAndDeleteAlertAction {
                actionSheet.modalPresentationStyle = .overFullScreen
                self?.present(actionSheet, animated: false)
            }
        }
        
        return cell
    }
}

extension OthersYesterdayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width - 10
        return CGSize(width: cellWidth, height: 500)
    }
}
