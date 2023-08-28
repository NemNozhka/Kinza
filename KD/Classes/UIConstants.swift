//
//  Constants.swift
//  KD
//
//  Created by Сергей Ножка on 22.08.2023.
//

import Foundation
import UIKit


class UIConstants {
    
    enum Colors {
        
        static let colorLabelLikeChildren: UIColor = UIColor(red: 255.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 100.0 / 100)
        static let colorSpicyLabel: UIColor = UIColor(red: 255.0 / 255.0, green: 71.0 / 255.0, blue: 71.0 / 255.0, alpha: 100.0 / 100)
        static let colorBackGroundColorButton: UIColor = UIColor(red: 149.0 / 255.0, green: 202.0 / 255.0, blue: 31.0 / 255.0, alpha: 60.0 / 100)
    }
    
    enum ConstantsForMenuViewCell {
        
        static let imageProductSize: CGFloat = 160
        static let insetImageProductFromTop: CGFloat = 15
        static let insetImageProductFromLeading: CGFloat = 15
        
        static let likeChildrenLabelFontSize: CGFloat = 11
        static let insetLikeChildrenFromImageProduct: CGFloat = 25
        static let insetLikeChildrenFromImageProductTop: CGFloat = 12
        static let heightLikeChildren: CGFloat = 25
        static let weidtLikeChildren: CGFloat = 110
        
        static let labelNameProductSize: CGFloat = 20
        static let labelNameProductFontSize: CGFloat = 14
        
        static let spacingBetweenNameAndDiscription: CGFloat = 10
        static let labelDiscriptionProductSize: CGFloat = 15
        
        static let insetButtonFromBottom: CGFloat = 10
        static let insetButtonFromTrailing: CGFloat = 40
        static let insetButtonTrailing: CGFloat = 90
        static let weidthtButton: CGFloat = 90
        static let insetButtonFromStackView: CGFloat = 12
        
        static let nameProductAndPriceProductStackViewSpacing: CGFloat = 12
        static let nameProductAndPriceProductStackViewHeight: CGFloat = 24
        static let insetNameAndDiscriptionFromImage: CGFloat = 12
        static let insetNameAndDiscriptionFromTrailing: CGFloat = 12
        
        static let insetSpicyLabelFromImageProduct: CGFloat = 25
        static let insetSpicyLabelFromImageProductTop: CGFloat = 12
        static let spicyLabelLabelFontSize: CGFloat = 11
        static let heightSpicyLabel: CGFloat = 25
        static let weidtSpicyLabel: CGFloat = 70
    }
    
    enum ConstantsForSingleProductView {
        static let imageProductSize: CGFloat = 300
        static let insetImageProductFromTop: CGFloat = 30
        static let insetImageProductFromLeading: CGFloat = 30
        
        static let insetLabelFromImage: CGFloat = 40
        
        static let insetButtonFromLabel: CGFloat = 40
        
        static let insetBackButtonFromTop: CGFloat = 20
        static let insetBackButtonFromLeading: CGFloat = 20
        static let sizeBackButton: CGFloat = 40
        
        static let insetLabelDescriptionFromButton: CGFloat = 20
        
        static let insetLabelWeightFromLabelDescription: CGFloat = 20
    }
}
