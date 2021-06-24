//
//  BottomControlView.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/14.
//

import UIKit

class BottomControlView: UIView {
    
    let reloadButtonView = BottomButtonView(frame: .zero, width: 50, imageName: "reload")
    let nopeButtonView = BottomButtonView(frame: .zero, width: 60, imageName: "nope")
    let superLikeButtonView = BottomButtonView(frame: .zero, width: 50, imageName: "superLike")
    let likeButtonView = BottomButtonView(frame: .zero, width: 60, imageName: "like")
    let BoostButtonView = BottomButtonView(frame: .zero, width: 50, imageName: "boost")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        // MARK: - Create Components
        let baseStackView = UIStackView(arrangedSubviews: [reloadButtonView,
                                                           nopeButtonView,
                                                           superLikeButtonView,
                                                           likeButtonView,
                                                           BoostButtonView])
        
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 10
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Add Components to view
        addSubview(baseStackView)
        
        // MARK: - Set Components constraint
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
         baseStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ].forEach { $0.isActive = true }
    }
    
}

class BottomButtonView: UIView {
    
    var button: BottomButton?
    
    init(frame: CGRect, width: CGFloat, imageName: String) {
        super.init(frame: frame)

        setupLayouts(frame: frame, width: width, imageName: imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts(frame: CGRect, width: CGFloat, imageName: String) {
        button = BottomButton(type: .custom)
        button?.setImage(UIImage(named: imageName)?.resize(size: .init(width: width * 0.4,
                                                                       height: width * 0.4)),
                         for: .normal)
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width / 2
        
        // set shadow configure
        button?.layer.shadowOffset = .init(width: 1.5, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
        
        // code으로 constraint부여시 필요한 설정!
        button?.translatesAutoresizingMaskIntoConstraints = false
        
        guard let button = button else { return }
        addSubview(button)
        
        button.anchor(centerY: centerYAnchor, centerX: centerXAnchor, width: width, height: width)
    }
}

class BottomButton: UIButton {
    
    override var isHighlighted: Bool {
        didSet {
            if isHighlighted {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    self.layoutIfNeeded()
                }
            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .identity // 기본 사이즈로 돌아옴
                    self.layoutIfNeeded()
                }
            }
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
