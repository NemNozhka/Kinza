//
//  LaunchScreenViewController.swift
//  KD
//
//  Created by Сергей Ножка on 12.10.2023.
//

import Foundation
import UIKit
import SnapKit

class LaunchScreenViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
    }
    
    func initialize() {
        view.backgroundColor = .systemGray6
        view.addSubview(image)
        image.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(300)
            make.width.equalTo(470)
            make.top.equalToSuperview().inset(200)
        }
        
        view.addSubview(label)
        label.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(image.snp.bottom).inset(20)
        }
        
        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(label.snp.bottom).offset(20)
            make.size.equalTo(40)
        }
    }
    
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "загрузка")
        return image
    }()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Здесь вкусно!"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    private let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .gray  // Установите цвет индикатора по своему усмотрению
        activityIndicator.startAnimating()
        return activityIndicator
    }()
    
}
