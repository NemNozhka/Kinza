//
//  BackViewController.swift
//  KD
//
//  Created by Сергей Ножка on 27.08.2023.
//

import Foundation
import UIKit

class BackViewController: UIViewController {
//    private var backButton: UIBarButtonItem {
//        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapBackButton))
//        return button
//    }
    
    func makeRightBarButtonItems() -> [UIBarButtonItem] {
        let button = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(tapBackButton))
        return [button]
    }
    
    @objc private func tapBackButton() {
        navigationController?.dismiss(animated: true)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        navigationItem.rightBarButtonItems = makeRightBarButtonItems()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}


