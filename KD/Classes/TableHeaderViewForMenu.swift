//
//  TableHeaderViewForMenu.swift
//  KD
//
//  Created by Сергей Ножка on 14.10.2023.
//

import Foundation
import UIKit
import SnapKit
import ScrollableSegmentedControl

class TableHeaderViewForMenu: UIView {
    
    weak var menuViewController: MenuViewController?
    
    convenience init() {
        self.init(frame: .zero)
        frame.size.height = 200
        configure()
    }
    
    func configure() {
        addSubview(segmentedControlMenu)
            
        segmentedControlMenu.snp.makeConstraints { make in
                make.top.bottom.leading.trailing.equalToSuperview()
                
            }
    }
    
    private let segmentedControlMenu: ScrollableSegmentedControl = {
        let segment = ScrollableSegmentedControl()
        segment.segmentStyle = .textOnly // Эта строка указывает, что сегменты будут содержать только текст
        segment.insertSegment(withTitle: "Пицца", image: nil, at: 0)
        segment.insertSegment(withTitle: "Блюда на мангале", image: nil, at: 1)
        segment.insertSegment(withTitle: "Хачапури", image: nil, at: 2)
        segment.insertSegment(withTitle: "К блюду", image: nil, at: 3)
        segment.backgroundColor = .red
        segment.selectedSegmentContentColor = UIColor.yellow
        segment.fixedSegmentWidth = false
        segment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func segmentedControlValueChanged(_ sender: ScrollableSegmentedControl) {
            menuViewController?.updateTableForSegment(index: sender.selectedSegmentIndex)
        }
}
