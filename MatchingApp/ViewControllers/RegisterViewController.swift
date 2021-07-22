//
//  RegisterViewController.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/07/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    private let nameTextField = RegisterTextField(placeholder: "Name")
    private let emailTextField = RegisterTextField(placeholder: "Email")
    private let passwordTextField = RegisterTextField(placeholder: "Password")
    
    let registerButton: UIButton = {
        let registerButton = UIButton(type: .system)
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .red
        registerButton.setTitleColor(.white, for: .normal)
        registerButton.layer.cornerRadius = 10
        return registerButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .yellow
        
        let baseStackView = UIStackView(arrangedSubviews: [nameTextField,
                                                           emailTextField,
                                                           passwordTextField,
                                                           registerButton])
        baseStackView.axis = .vertical
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 20
        
        view.addSubview(baseStackView)
        nameTextField.anchor(height: 45)
        baseStackView.anchor(left: view.leftAnchor,
                             right: view.rightAnchor,
                             centerY: view.centerYAnchor,
                             leftPadding: 40,
                             rightPadding: 40)
        
        
    }
    
}
