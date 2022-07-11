//
//  ViewController.swift
//  WiproTest
//
//  Created by RandyKBannister on 7/11/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let inputStackView = UIStackView()
    private let emailField = UITextField()
    private let passwordField = UITextField()
    private let confirmField = UITextField()
    
    private let createUserButton = UIButton()
    
    private struct Constants {
        let inputViewsVPadding = 30.0
        let textFieldHPadding = 50.0
        let textFieldHeight = 15.0
    }
    
    private let constants = Constants()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initSubviews()
    }
    
    private func initSubviews() {
        emailField.placeholder = "Email"
        passwordField.placeholder = "Password"
        confirmField.placeholder = "Confirm password"
        
        passwordField.isSecureTextEntry = true
        confirmField.isSecureTextEntry = true
        
        createUserButton.setTitle("Create User", for: .normal)
        createUserButton.setTitleColor(.blue, for: .normal)
        createUserButton.addTarget(self, action: #selector(createUserClicked), for: .touchUpInside)
        
        inputStackView.axis = .vertical
        inputStackView.distribution = .equalCentering
        inputStackView.spacing = constants.inputViewsVPadding
        
        view.addSubview(inputStackView)
        inputStackView.addArrangedSubview(emailField)
        inputStackView.addArrangedSubview(passwordField)
        inputStackView.addArrangedSubview(confirmField)
        inputStackView.addArrangedSubview(createUserButton)
        
        createUserButton.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
        
        inputStackView.snp.makeConstraints { (make) in
            make.leading.trailing.equalToSuperview().inset(constants.textFieldHPadding)
            make.centerY.equalToSuperview()
        }
    }
}

extension ViewController {
    @objc func createUserClicked() {
        
    }
}

