//
//  TableHeaderViewForMenu.swift
//  KD
//
//  Created by Сергей Ножка on 14.10.2023.
//

import Foundation
import UIKit
import SnapKit

class TableHeaderViewForMenu: UIView {
    var buttonTapped: ((Int) -> Void)?
    
    private let scrollView = UIScrollView()
    
    convenience init() {
        self.init(frame: .zero)
        configure()
    }
    
    func updateSelectedButton(for section: Int) {
        for (index, button) in buttons.enumerated() {
            let isSelected = index == section
            button.backgroundColor = isSelected ? UIConstants.Colors.colorBackGroundColorButton : .systemGray4
            
            if isSelected {
                let buttonFrame = scrollView.convert(button.frame, from: button.superview)
                if buttonFrame.minX < scrollView.contentOffset.x {
                    scrollView.setContentOffset(CGPoint(x: buttonFrame.minX, y: 0), animated: true)
                } else if buttonFrame.maxX > scrollView.contentOffset.x + scrollView.bounds.width {
                    scrollView.setContentOffset(CGPoint(x: buttonFrame.maxX - scrollView.bounds.width, y: 0), animated: true)
                }
            }
        }
    }
    
    private func configure() {
        backgroundColor = .systemGray6

        scrollView.showsHorizontalScrollIndicator = false
        addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(33)
            make.leading.equalToSuperview()
        }
        
        let stackView = UIStackView()
        stackView.axis = .horizontal
                stackView.spacing = 20
                scrollView.addSubview(stackView)
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        stackView.addArrangedSubview(buttonThree)
        stackView.addArrangedSubview(buttonFour)
                stackView.snp.makeConstraints { make in
                    make.top.bottom.equalToSuperview()
                    make.leading.equalToSuperview().inset(20)
                    make.trailing.equalToSuperview()
                    make.height.equalToSuperview()
                }
        
        buttonOne.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.width.equalTo(100)
        }
        
        buttonTwo.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.width.equalTo(160)
        }
        
        buttonThree.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.width.equalTo(100)
        }
        
        buttonFour.snp.makeConstraints { make in
            make.height.equalTo(33)
            make.width.equalTo(100)
        }
    }
    
    private let buttonOne: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Пицца", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.backgroundColor = .systemGray4
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.tag = 0
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let buttonTwo: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Блюда на мангале", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.backgroundColor = .systemGray4
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.tag = 1
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let buttonThree: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Хачапури", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.backgroundColor = .systemGray4
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.tag = 2
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private let buttonFour: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("К блюду", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .light)
        button.backgroundColor = .systemGray4
        button.tintColor = .black
        button.layer.cornerRadius = 12
        button.tag = 3
        button.addTarget(self, action: #selector(buttonAction(sender:)), for: .touchUpInside)
        return button
    }()
    
    private var buttons: [UIButton] {
            [buttonOne, buttonTwo, buttonThree, buttonFour]
        }
    
    @objc private func buttonAction(sender: UIButton) {
            for button in buttons {
                button.backgroundColor = button == sender ? UIConstants.Colors.colorBackGroundColorButton : .systemGray4
            }
            buttonTapped?(sender.tag)
        }
}

