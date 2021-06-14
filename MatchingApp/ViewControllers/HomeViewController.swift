//
//  ViewController.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/12.
//

import UIKit

class HomeViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemPink
        return view
    }()
    
    let bottomView = BottomControlView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let stackView = UIStackView(arrangedSubviews: [topView, middleView, bottomView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        [topView.heightAnchor.constraint(equalToConstant: 100),
         bottomView.heightAnchor.constraint(equalToConstant: 120),
         stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ].forEach { $0.isActive = true }
    }
    
    
}

