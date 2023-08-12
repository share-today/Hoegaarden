//
//  MyThatDayViewController.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/03/09.
//

import UIKit

class MyThatDayViewController: UIViewController {
    
    private let toast = Toast()
    private var alert = SweetAlert()
    
    private lazy var myThatDayView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1)
        
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1),
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1)]
        layer.locations = [0.5, 1.0]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        view.layer.addSublayer(layer)
        view.layer.cornerRadius = 8
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(dateLabel)
        view.addSubview(contentLabel)
        view.addSubview(moreButton)
       
        return view
    }()
    
    private var dateLabel: UILabel = {
        let label = UILabel()
        label.text = BundleStory.myThatDayDate
        label.textColor = .black
        label.font = Font.air.of(size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var contentLabel: UILabel = {
        let contentLabel = UILabel()
        contentLabel.text = BundleStory.myThatDayContent
        contentLabel.numberOfLines = 0
        contentLabel.textColor = .black
        contentLabel.backgroundColor = .clear
        contentLabel.font = Font.air.of(size: 16)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        return contentLabel
    }()
    
    private var moreButton: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "more")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
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
        setGradientLayer()
        setCollectionView()
        setAddTarget()
        setConstraints()
    }
    
    private func setup() {
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    private func addViews() {
        view.addSubview(myThatDayView)
        view.addSubview(collectionView)
    }
    
    private func setGradientLayer() {
        let layer = CAGradientLayer()
        layer.colors = [UIColor(red: 0.904, green: 0.931, blue: 1, alpha: 1).cgColor,
                        UIColor(red: 0.846, green: 0.888, blue: 0.996, alpha: 1).cgColor]
        layer.startPoint = CGPoint(x: 0.5, y: 0.0)
        layer.endPoint = CGPoint(x: 0.5, y: 1.0)
        layer.locations = [0, 1]
        layer.frame = myThatDayView.bounds
        layer.bounds = view.bounds.insetBy(dx: -0.5 * view.bounds.size.width, dy: -0.5 * view.bounds.size.height)
        layer.position = view.center
        myThatDayView.layer.insertSublayer(layer, at: 0)
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyThatDayCell.self, forCellWithReuseIdentifier: "MyThatDayCell")
    }
    
    private func setAddTarget() {
        moreButton.addTarget(self, action: #selector(showMoreButton), for: .touchUpInside)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            myThatDayView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            myThatDayView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            myThatDayView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            myThatDayView.heightAnchor.constraint(equalToConstant: 242),
            
            dateLabel.topAnchor.constraint(equalTo: myThatDayView.topAnchor, constant: 24),
            dateLabel.leadingAnchor.constraint(equalTo: myThatDayView.leadingAnchor, constant: 24),
            
            contentLabel.topAnchor.constraint(equalTo: myThatDayView.topAnchor, constant: 68),
            contentLabel.bottomAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: -68),
            contentLabel.leadingAnchor.constraint(equalTo: myThatDayView.leadingAnchor, constant: 24),
            contentLabel.trailingAnchor.constraint(equalTo: myThatDayView.trailingAnchor, constant: -24),
            
            moreButton.bottomAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: -24),
            moreButton.trailingAnchor.constraint(equalTo: myThatDayView.trailingAnchor, constant: -30),
            
            collectionView.topAnchor.constraint(equalTo: myThatDayView.bottomAnchor, constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func emptyStateView() {
        let label = UILabel()
        label.text = BundleStory.myThatDayEmptyState
        label.textColor = .black
        label.font = Font.air.of(size: 16)
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
    
    @objc private func deleteButtonAction() {
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


extension MyThatDayViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyThatDayCell", for: indexPath) as! MyThatDayCell
        
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

extension MyThatDayViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = collectionView.frame.width
        let cellHeight = collectionView.frame.height
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
