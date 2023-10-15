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
    
    weak var menuViewController: MenuViewController?
    
    convenience init() {
        self.init(frame: .zero)
        frame.size.height = 50
        configure()
    }
    
    func configure() {
        addSubview(scrollView)
            scrollView.addSubview(segmentedControlMenu)
            
            scrollView.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }
            
            segmentedControlMenu.snp.makeConstraints { make in
                make.top.bottom.equalToSuperview()
                make.leading.trailing.equalToSuperview()
                make.height.equalTo(30)  // Устанавливаем высоту UISegmentedControl
                make.width.greaterThanOrEqualTo(scrollView).offset(20)
            }
    }
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isDirectionalLockEnabled = true
        return scrollView
    }()
    
    private let segmentedControlMenu: UISegmentedControl = {
       let segment = UISegmentedControl(items: ["Пицца", "Блюда на мангале", "Хачапури", "К блюду"])
        segment.addTarget(self, action: #selector(segmentedControlValueChanged(_:)), for: .valueChanged)
        return segment
    }()
    
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
            menuViewController?.updateTableForSegment(index: sender.selectedSegmentIndex)
        }
}
