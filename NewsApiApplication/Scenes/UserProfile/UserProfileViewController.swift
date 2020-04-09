//
//  UserProfileViewController.swift
//  NewsApiApplication
//
//  Created by OkieLa Dev on 4/9/20.
//  Copyright © 2020 none. All rights reserved.
//

import UIKit

class UserProfileViewController: BaseViewController {
    
    // MARK: - Properties

    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    lazy var viewModel: UserProfileViewModel = { UserProfileViewModel() }()
    
    // MARK: - View Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func configureUI() {
        super.configureUI()
        
        title = "User Profile"
    }
    
    override func layoutUI() {
        super.layoutUI()
        
        registerButton.layer.cornerRadius = 4
        registerButton.layer.masksToBounds = true
    }
    
    override func dataBinding() {
        super.dataBinding()
        viewModel.dataBinding()
        viewModel.user.accept(UserDefaultController.shared.currentUser)
        
        viewModel.phone
            .bind(to: phoneTextField.rx.text)
            .disposed(by: disposeBag)
        phoneTextField.rx.text
            .bind(to: viewModel.phone)
            .disposed(by: disposeBag)
        viewModel.password
            .bind(to: passwordTextField.rx.text)
            .disposed(by: disposeBag)
        passwordTextField.rx.text
            .bind(to: viewModel.password)
            .disposed(by: disposeBag)
        
        registerButton.rx.tap
            .bind(to: viewModel.registerHandler)
            .disposed(by: disposeBag)
        
        viewModel.user.asDriver(onErrorJustReturn: nil)
            .drive(onNext: { [weak self] user in
                guard let user = user else {
                    self?.phoneTextField.placeholder = "Your phone number"
                    self?.phoneTextField.backgroundColor = .white
                    self?.phoneTextField.isEnabled = true
                    
                    self?.passwordTextField.placeholder = "Your password"
                    self?.passwordTextField.backgroundColor = .white
                    self?.passwordTextField.isEnabled = true
                    self?.registerButton.setTitle("Register", for: .normal)
                    
                    return
                }

                self?.phoneTextField.placeholder = user.phone
                self?.phoneTextField.backgroundColor = .init(white: 0.9, alpha: 0.9)
                self?.phoneTextField.isEnabled = false
                
                self?.passwordTextField.text = user.password
                self?.passwordTextField.backgroundColor = .init(white: 0.9, alpha: 0.9)
                self?.passwordTextField.isEnabled = false
                self?.registerButton.setTitle("Already register", for: .normal)
            })
        .disposed(by: disposeBag)
        
        viewModel.enableRegister
            .drive(onNext: { [weak self] enable in
                self?.registerButton.backgroundColor = enable ? Constant.blueThemeColor : .lightGray
                self?.registerButton.isEnabled = enable
            })
        .disposed(by: disposeBag)
    }
}
