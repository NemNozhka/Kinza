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
    var isPhoneNumberField = false
    private var unformattedPhoneNumber = ""
    
    //MARK: - initialize
    init(placeholder: String, isPhoneNumberField: Bool = false) {
            self.isPhoneNumberField = isPhoneNumberField
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
        
        if isPhoneNumberField {
                    keyboardType = .numberPad
                    addTarget(self, action: #selector(phoneNumberFormatting), for: .editingChanged)
                }
        
        
    }
    
    
    
    
        
    @objc private func phoneNumberFormatting() {
        guard var text = self.text else { return }
        
        // Убедитесь, что ввод начинается с 7 или 8, затем замените его на +7
        if text.count > 0, let firstCharacter = text.first, firstCharacter == "8" || firstCharacter == "7" {
            text.removeFirst()
            text = "+7" + text  // Исправлено здесь: добавлено сложение строк
        }
        
        // Убираем все символы, кроме цифр
        let digits = text.filter { $0.isNumber }
        
        // Форматируем номер телефона в соответствии с шаблоном +7(XXX)XXX-XX-XX
        var formattedNumber = "+7"
        if digits.count > 1 {
            formattedNumber += "("
        }
        for (index, digit) in digits.dropFirst().enumerated() {
            switch index {
            case 0...1:
                formattedNumber.append(digit)
            case 2:
                formattedNumber.append("\(digit))")
            case 3...5:
                formattedNumber.append(digit)
            case 6:
                formattedNumber.append("-\(digit)")
            case 7...7:
                formattedNumber.append(digit)
            case 8:
                formattedNumber.append("-\(digit)")
            case 9:
                formattedNumber.append(digit)
            default:
                break
            }
        }
        
        self.text = formattedNumber
    }

    
    
    
}


