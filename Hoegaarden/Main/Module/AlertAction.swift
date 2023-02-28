//
//  AlertAction.swift
//  Hoegaarden
//
//  Created by 혜리 on 2023/02/28.
//

import UIKit

// MARK: - 신고하기 & 삭제하기 ActionSheet

class ReportAndDeleteAlertAction: UIViewController {
    
    var alert = SweetAlert()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actionSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(reportButton)
        view.addSubview(deleteButton)
        return view
    }()
    
    lazy var reportButton: UIButton = {
        let button = UIButton()
        button.setTitle("신고하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var defaultHeight: CGFloat = 180
    private var actionSheetViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setBackgroundView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showActionSheet()
    }
    
    private func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(actionSheetView)
    }
    
    private func setBackgroundView() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        backgroundView.addGestureRecognizer(dimmedTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        actionSheetViewTopConstraint = actionSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
        NSLayoutConstraint.activate([
            actionSheetViewTopConstraint,
            actionSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            actionSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            actionSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            reportButton.topAnchor.constraint(equalTo: actionSheetView.topAnchor, constant: 30),
            reportButton.centerXAnchor.constraint(equalTo: actionSheetView.centerXAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: reportButton.topAnchor, constant: 70),
            deleteButton.centerXAnchor.constraint(equalTo: actionSheetView.centerXAnchor)
        ])
    }
    
    private func showActionSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        actionSheetViewTopConstraint.constant = (safeAreaHeight + bottomPadding) - defaultHeight
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideActionSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        actionSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    @objc func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideActionSheetAndGoBack()
    }
}

// MARK: - 수정하기 & 삭제하기 ActionSheet

class ModifyAndDeleteAlertAction: UIViewController {
    
    var alert = SweetAlert()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actionSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(modifyButton)
        view.addSubview(deleteButton)
        return view
    }()
    
    lazy var modifyButton: UIButton = {
        let button = UIButton()
        button.setTitle("수정하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var defaultHeight: CGFloat = 180
    private var actionSheetViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setBackgroundView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showActionSheet()
    }
    
    private func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(actionSheetView)
    }
    
    private func setBackgroundView() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        backgroundView.addGestureRecognizer(dimmedTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        actionSheetViewTopConstraint = actionSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
        NSLayoutConstraint.activate([
            actionSheetViewTopConstraint,
            actionSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            actionSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            actionSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            modifyButton.topAnchor.constraint(equalTo: actionSheetView.topAnchor, constant: 30),
            modifyButton.centerXAnchor.constraint(equalTo: actionSheetView.centerXAnchor),
            
            deleteButton.topAnchor.constraint(equalTo: modifyButton.topAnchor, constant: 70),
            deleteButton.centerXAnchor.constraint(equalTo: actionSheetView.centerXAnchor)
        ])
    }
    
    private func showActionSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        actionSheetViewTopConstraint.constant = (safeAreaHeight + bottomPadding) - defaultHeight
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideActionSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        actionSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    @objc func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideActionSheetAndGoBack()
    }
}

// MARK: - 삭제하기 ActionSheet

class DeleteAlertAction: UIViewController {
    
    var alert = SweetAlert()
    
    private lazy var backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.darkGray.withAlphaComponent(0.7)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actionSheetView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 16
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        return view
    }()
    
    lazy var deleteButton: UIButton = {
        let button = UIButton()
        button.setTitle("삭제하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = Font.air.of(size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var defaultHeight: CGFloat = 130
    private var actionSheetViewTopConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addViews()
        setBackgroundView()
        setConstraints()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        showActionSheet()
    }
    
    private func addViews() {
        view.addSubview(backgroundView)
        view.addSubview(actionSheetView)
    }
    
    private func setBackgroundView() {
        let dimmedTap = UITapGestureRecognizer(target: self, action: #selector(dimmedViewTapped(_:)))
        backgroundView.addGestureRecognizer(dimmedTap)
        backgroundView.isUserInteractionEnabled = true
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let topConstant = view.safeAreaInsets.bottom + view.safeAreaLayoutGuide.layoutFrame.height
        actionSheetViewTopConstraint = actionSheetView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstant)
        NSLayoutConstraint.activate([
            actionSheetViewTopConstraint,
            actionSheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            actionSheetView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            actionSheetView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            deleteButton.topAnchor.constraint(equalTo: actionSheetView.topAnchor, constant: 30),
            deleteButton.centerXAnchor.constraint(equalTo: actionSheetView.centerXAnchor)
        ])
    }
    
    private func showActionSheet() {
        let safeAreaHeight: CGFloat = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding: CGFloat = view.safeAreaInsets.bottom
        
        actionSheetViewTopConstraint.constant = (safeAreaHeight + bottomPadding) - defaultHeight
        
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.7
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func hideActionSheetAndGoBack() {
        let safeAreaHeight = view.safeAreaLayoutGuide.layoutFrame.height
        let bottomPadding = view.safeAreaInsets.bottom
        actionSheetViewTopConstraint.constant = safeAreaHeight + bottomPadding
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseIn, animations: {
            self.backgroundView.alpha = 0.0
            self.view.layoutIfNeeded()
        }) { _ in
            if self.presentingViewController != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }
    
    @objc func dimmedViewTapped(_ tapRecognizer: UITapGestureRecognizer) {
        hideActionSheetAndGoBack()
    }
}
