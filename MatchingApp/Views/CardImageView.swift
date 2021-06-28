//
//  CardImageView.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/28.
//

import UIKit

class CardImageView: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
        clipsToBounds = true
        image = UIImage(named: "baby_soyeon")
//        image = UIImage(named: "test_image1")
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
