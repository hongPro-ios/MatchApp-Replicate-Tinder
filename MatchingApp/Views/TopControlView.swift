//
//  TopControlView.swift
//  MatchingApp
//
//  Created by JEONGSEOB HONG on 2021/06/17.
//

import UIKit
import RxCocoa
import RxSwift

class TopControlView: UIView {
    
    static private func createTopButton(selectedImageName: String, unselectedImageName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: selectedImageName), for: .selected)
        button.setImage(UIImage(named: unselectedImageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }
    
    private let disposeBag = DisposeBag()
    
    let tinderButton = createTopButton(selectedImageName: "tinder-selected",
                                       unselectedImageName: "tinder-unselected")
    let goodButton = createTopButton(selectedImageName: "good-selected",
                                     unselectedImageName: "good-unselected")
    let commentButton = createTopButton(selectedImageName: "comment-selected",
                                        unselectedImageName: "comment-unselected")
    let profileButton = createTopButton(selectedImageName: "profile-selected",
                                        unselectedImageName: "profile-unselected")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayouts()
        setupBindings()
        setupInitConfigures()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayouts() {
        
        // MARK: - Create Components
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton,
                                                           goodButton,
                                                           commentButton,
                                                           profileButton])
        
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // MARK: - Add Components to view
        addSubview(baseStackView)
        
        // MARK: - Set Components constraint
        baseStackView.anchor(
            top: topAnchor,
            bottom: bottomAnchor,
            left: leftAnchor,
            right: rightAnchor,
            leftPadding: 40,
            rightPadding: 40)
    }
    
    private func setupBindings() {
        tinderButton.rx.tap
            .asDriver()
            .map { self.tinderButton }
            .drive { [weak self] button in self?.handleSelectedButton(selectedButton: button) }
            .disposed(by: disposeBag)
        
        goodButton.rx.tap
            .asDriver()
            .map { self.goodButton }
            .drive { [weak self] button in self?.handleSelectedButton(selectedButton: button) }
            .disposed(by: disposeBag)
        
        commentButton.rx.tap
            .asDriver()
            .map { self.commentButton }
            .drive { [weak self] button in self?.handleSelectedButton(selectedButton: button) }
            .disposed(by: disposeBag)
        
        profileButton.rx.tap
            .asDriver()
            .map { self.profileButton }
            .drive { [weak self] button in self?.handleSelectedButton(selectedButton: button) }
            .disposed(by: disposeBag)
    }
    
    private func handleSelectedButton(selectedButton: UIButton) {
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach { button in
            button.isSelected = button == selectedButton ? true : false
        }
    }
    
    private func setupInitConfigures() {
        tinderButton.isSelected = true
    }
    
}

