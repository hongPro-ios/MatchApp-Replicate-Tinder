//
//  CardView.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/17.
//

import UIKit

class CardView: UIView {
    
    let cardImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .blue
        imageView.layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "baby_soyeon")
        return imageView
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        label.text = "Hong, 31"
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "info.circle.fill")?.resize(size: .init(width: 40, height: 40)), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let residenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.textColor = .white
        label.text = "日本, 大阪"
        return label
    }()
    
    let hobbyLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.text = "hobbyLabel"
        return label
    }()
    
    let introduction: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .regular)
        label.textColor = .white
        label.text = "introduction"
        return label
    }()
    
    let goodLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "GOOD"
        label.textColor = UIColor.rgb(red: 137, green: 223, blue: 86)
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.rgb(red: 137, green: 223, blue: 86).cgColor
        label.layer.cornerRadius = 10
        
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    let nopeLabel: UILabel = {
       let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.text = "NOPE"
        label.textColor = UIColor.rgb(red: 222, green: 223, blue: 86)
        
        label.layer.borderWidth = 3
        label.layer.borderColor = UIColor.rgb(red: 222, green: 223, blue: 86).cgColor
        label.layer.cornerRadius = 10
        
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
        
        
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
    
    
}
