//
//  UIButton+Extension.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/28.
//

import UIKit

extension UIButton {
    func createCardInfoButton() -> UIButton {
        self.setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        self.tintColor = .white
        self.imageView?.contentMode = .scaleAspectFit
        return self
    }
}
