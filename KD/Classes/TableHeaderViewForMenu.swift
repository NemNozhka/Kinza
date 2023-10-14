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
    
    convenience init() {
        self.init(frame: .zero)
        frame.size.height = 200
        configure()
    }
    
    func configure() {
        
    }
    
    private let segmentedControlMenu: UISegmentedControl = {
       let segment = UISegmentedControl()
        
        return segment
    }()
}
