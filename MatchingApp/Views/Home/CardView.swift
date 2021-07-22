//
//  CardView.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/17.
//

import UIKit

class CardView: UIView {
    
    private let gradientLayer = CAGradientLayer()
    
    // MARK: - UIViews
    private let cardImageView = CardImageView(frame: .zero)
    private let infoButton = UIButton(type: .system).createCardInfoButton()
    private let nameLabel = CardInfoLabel(frame: .zero, labelText: "Hong, 31", labelFont: .systemFont(ofSize: 40, weight: .heavy))
    private let residenceLabel = CardInfoLabel(frame: .zero, labelText: "日本, 大阪", labelFont: .systemFont(ofSize: 20, weight: .regular))
    private let hobbyLabel = CardInfoLabel(frame: .zero, labelText: "hobbyLabel", labelFont: .systemFont(ofSize: 25, weight: .regular))
    private let introduction = CardInfoLabel(frame: .zero, labelText: "introduction", labelFont: .systemFont(ofSize: 25, weight: .regular))
    private let goodLabel = CardInfoLabel(frame: .zero, labelText: "GOOD", labelColor: .rgb(red: 137, green: 223, blue: 86))
    private let nopeLabel = CardInfoLabel(frame: .zero, labelText: "NOPE", labelColor: .rgb(red: 222, green: 110, blue: 110))

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
        setupGradientLayer()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView))
        addGestureRecognizer(panGesture)
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self)
        
        if gesture.state == .changed {
            handlePanChange(translation: translation)
            
        } else if gesture.state == .ended {
            handlePanEnded()
            
        }
    }
    
    private func handlePanChange(translation: CGPoint) {
        let degree: CGFloat = translation.x / 20
        let angle = degree * .pi / 100
        
        let rotationTranslation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationTranslation.translatedBy(x: translation.x, y: translation.y)
        
        let ratio: CGFloat = 1 / 100
        let ratioValue = ratio * translation.x
        
        if translation.x > 0 {
            self.goodLabel.alpha = ratioValue
        } else if translation.x < 0 {
            self.nopeLabel.alpha = -ratioValue
        }
    }
    
    private func handlePanEnded() {
        UIView.animate(
            withDuration: 1,
            delay: 0,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.7,
            options: []
        ) {
            self.transform = .identity
            self.layoutIfNeeded()
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introduction])
        infoVerticalStackView.axis = .vertical
        
        let baseStackView = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        baseStackView.axis = .horizontal
        
        addSubview(cardImageView)
        cardImageView.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            leftPadding: 10,
            rightPadding: 10)
        
        addSubview(baseStackView)
        baseStackView.anchor(
            bottom: cardImageView.bottomAnchor,
            left: cardImageView.leftAnchor,
            right: cardImageView.rightAnchor,
            bottomPadding: 20,
            leftPadding: 20,
            rightPadding: 20)
        
        infoButton.anchor(width: 40)
        
        addSubview(nameLabel)
        nameLabel.anchor(
            bottom: baseStackView.topAnchor,
            left: cardImageView.leftAnchor,
            bottomPadding: 10,
            leftPadding: 20
        )
        
        addSubview(goodLabel)
        goodLabel.anchor(top: cardImageView.topAnchor,
                         left: cardImageView.leftAnchor,
                         width: 140,
                         height: 55,
                         topPadding: 25,
                         leftPadding: 25)
        
        addSubview(nopeLabel)
        nopeLabel.anchor(top: cardImageView.topAnchor,
                         right: cardImageView.rightAnchor,
                         width: 140,
                         height: 55,
                         topPadding: 25,
                         rightPadding: 25)
    }
    
    private func setupGradientLayer() {
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.3, 1.1]
        cardImageView.layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.bounds
    }
}
