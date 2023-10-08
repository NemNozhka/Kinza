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
        static let colorBackGroundColorButton: UIColor = UIColor(red: 186.0 / 255.0, green: 218.0 / 255.0, blue: 117.0 / 255.0, alpha: 100 / 100)
        static let colorBackGroundColorStack: UIColor = UIColor(red: 186.0 / 255.0, green: 218.0 / 255.0, blue: 150.0 / 255.0, alpha: 100 / 100)
        static let colorForBackGroundTextField = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
    }
    
    enum ConstantsForMenuViewCell {
        
        static let cellHeight: CGFloat = 160
        
        static let imageProductSize: CGFloat = 140
        static let insetImageProductFromTop: CGFloat = 15
        static let insetImageProductFromLeading: CGFloat = 15
        
        static let likeChildrenLabelFontSize: CGFloat = 11
        static let insetLikeChildrenFromImageProduct: CGFloat = 25
        static let insetLikeChildrenFromImageProductTop: CGFloat = 5
        static let heightLikeChildren: CGFloat = 22
        static let widthLikeChildren: CGFloat = 95
        
        static let insetSpicyLabelFromImageProduct: CGFloat = 25
        static let insetSpicyLabelFromImageProductTop: CGFloat = 5
        static let spicyLabelLabelFontSize: CGFloat = 11
        static let heightSpicyLabel: CGFloat = 22
        static let widthSpicyLabel: CGFloat = 55
        
        static let labelSize: CGFloat = 20
        static let labelNameProductFontSize: CGFloat = 18
        
        static let spacingBetweenNameAndDiscription: CGFloat = 5
        static let labelDiscriptionProductSize: CGFloat = 12
        
        static let labelButtonAddBusketFontSize: CGFloat = 16
        static let insetButtonFromBottom: CGFloat = 10
        static let insetButtonFromTrailing: CGFloat = 40
        static let insetButtonTrailing: CGFloat = 90
        static let widthButton: CGFloat = 95
        static let heightButton: CGFloat = 30
        static let insetButtonFromStackView: CGFloat = 12
        
        static let nameProductAndPriceProductStackViewSpacing: CGFloat = 12
        static let nameProductAndPriceProductStackViewHeight: CGFloat = 24
        static let insetNameAndDiscriptionFromImage: CGFloat = 12
        static let insetNameAndDiscriptionFromTrailing: CGFloat = 12
        
    }
    
    enum ConstantsForSingleProductView {
        static let imageProductSize: CGFloat = 320
        static let insetImageProductFromNameLabel: CGFloat = 30
        static let insetImageProductFromLeading: CGFloat = 30
        
        static let insetNameLabelFromImage: CGFloat = 40
        static let insetNameLabelFromTop: CGFloat = 30
        static let labelSize: CGFloat = 30
        
        static let insetAddBasketButtonFromLabelWeight: CGFloat = 40
        static let widthAddBasketButton: CGFloat = 320
        static let heightAddBusketButton: CGFloat = 60
        static let insetAddBasketButtonFromBottom: CGFloat = 100
        
        static let insetBackButtonFromTop: CGFloat = 20
        static let insetBackButtonFromLeading: CGFloat = 20
        static let sizeBackButton: CGFloat = 40
        
        static let insetLabelDescriptionFromImageProduct: CGFloat = 20
        static let insetLabelDescriptionFromLeading: CGFloat = 20
        static let insetLabelDesriptionFromTrailing: CGFloat = 20
        
        static let insetLabelWeightFromLabelDescription: CGFloat = 20
        
        static let InsetLabelWeightFromLabelDiscriprion: CGFloat = 20
        static let insetLabelWeightFromLeading: CGFloat = 20
    }
    
    enum ConstantsForBasketViewCell {
        
        static let cellHeight: CGFloat = 120
        
        static let imageProductSize: CGFloat = 100
        static let insetImageProductFromTop: CGFloat = 15
        static let insetImageProductFromLeading: CGFloat = 15
        static let insetImageProductFromBottom: CGFloat = 15
        
        static let likeChildrenLabelFontSize: CGFloat = 11
        static let insetLikeChildrenFromImageProduct: CGFloat = 25
        static let insetLikeChildrenFromImageProductTop: CGFloat = 12
        static let heightLikeChildren: CGFloat = 25
        static let widthLikeChildren: CGFloat = 110
        
        static let labelSize: CGFloat = 20
        static let labelNameProductFontSize: CGFloat = 14
        
        static let spacingBetweenNameAndDiscription: CGFloat = 10
        static let labelDiscriptionProductSize: CGFloat = 15
        
        static let insetButtonFromBottom: CGFloat = 10
        static let insetButtonFromTrailing: CGFloat = 40
        static let insetButtonTrailing: CGFloat = 90
        static let widthButton: CGFloat = 90
        static let insetButtonFromStackView: CGFloat = 12
        
        static let nameProductAndPriceProductStackViewSpacing: CGFloat = 12
        static let nameProductAndPriceProductStackViewHeight: CGFloat = 24
        static let insetNameAndDiscriptionFromImage: CGFloat = 12
        static let insetNameAndDiscriptionFromTrailing: CGFloat = 12
        
        //        static let insetSpicyLabelFromImageProduct: CGFloat = 25
        //        static let insetSpicyLabelFromImageProductTop: CGFloat = 12
        //        static let spicyLabelLabelFontSize: CGFloat = 11
        //        static let heightSpicyLabel: CGFloat = 25
        //        static let widthSpicyLabel: CGFloat = 70
    }
}
