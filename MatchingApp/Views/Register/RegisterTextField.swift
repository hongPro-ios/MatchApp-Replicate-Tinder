//
//  RegisterTextField.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/07/22.
//

import UIKit

class RegisterTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.placeholder = placeholder
        borderStyle = .roundedRect
        font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
