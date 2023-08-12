//
//  OthersYesterdayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/27.
//

import UIKit

class OthersYesterdayViewController: UIViewController {
    
    private let toast = Toast()
    private let alert = SweetAlert()
    
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
        actionSheet.mainButton.addTarget(self, action: #selector(reportButtonTapped), for: .touchUpInside)
        
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        actionSheet.secondButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        return actionSheet
    }()
    
    private lazy var modifyAndDeleteAlertAction: CustomAlertAction = {
        let actionSheet = CustomAlertAction()
        actionSheet.setMainButtonTitle(AlertMessage.modifyButton)
        actionSheet.mainButton.addTarget(self, action: #selector(modifyButtonTapped), for: .touchUpInside)
        
        actionSheet.setSecondaryButtonTitle(AlertMessage.deleteButton)
        actionSheet.secondButton.addTarget(self, action: #selector(modifyDeleteButtonTapped), for: .touchUpInside)
        
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
        setCollectionView()
    }

    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func setCollectionView() {
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(OthersCell.self, forCellWithReuseIdentifier: "OthersCell")
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -30),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    @objc private func reportButtonTapped() {
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
    
    @objc private func deleteButtonTapped() {
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
    
    @objc private func modifyButtonTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.modifyMessage,
                        style: AlertStyle.customImage(imageFile: "modify"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.modifyButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false)
            }
        }
    }
    
    @objc private func modifyDeleteButtonTapped() {
        alert.showAlert("",
                        subTitle: AlertMessage.sendDeleteMessage,
                        style: AlertStyle.customImage(imageFile: "trash"),
                        buttonTitle: AlertMessage.cancelButton,
                        buttonColor: .white,
                        otherButtonTitle: AlertMessage.deleteButton,
                        otherButtonColor: .black) { [self] (isOtherButton) -> Void in
            if isOtherButton == true { }
            else {
                dismiss(animated: false)

                toast.showToast(image: UIImage(imageLiteralResourceName: "trash"),
                                     message: ToastMessage.trashToast)
            }
        }
    }
}

extension OthersYesterdayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OthersCell", for: indexPath) as! OthersCell
        
        let data = dataArray[indexPath.item]
        cell.dateLabel.text = data.date
        cell.contentLabel.text = data.content
        
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
