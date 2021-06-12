//
//  ViewController.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/12.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let topView = UIView()
        topView.backgroundColor = .blue
        let middleView = UIView()
        middleView.backgroundColor = .red
        let bottomView = UIView()
        bottomView.backgroundColor = .brown
        
        let stackView = UIStackView(arrangedSubviews: [topView, middleView, bottomView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        [
            topView.heightAnchor.constraint(equalToConstant: 100),
            bottomView.heightAnchor.constraint(equalToConstant: 100),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    
}

