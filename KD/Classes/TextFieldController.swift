//
//  TextFieldController.swift
//  KD
//
//  Created by Сергей Ножка on 06.09.2023.
//

import Foundation
import UIKit
import SnapKit

//MARK: - TextFieldController
class TextFieldController: UITextField {
    
    //MARK: - Private property
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    
    //MARK: - initialize
    init(placeholder: String) {
        super.init(frame: .zero)
        setUpTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override method
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    //MARK: - Private method
    private func setUpTextField(placeholder: String) {
        textColor = .black
        
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
     
        attributedPlaceholder = NSAttributedString(string: placeholder)
        font = .boldSystemFont(ofSize: 18) //жирный шрифт размером 18 поинтов
        
        self.snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
