//
//  LogoView.swift
//  KD
//
//  Created by Сергей Ножка on 04.08.2023.
//

import UIKit
import SnapKit

// Файл с логотипом

class LogoView: UIView {
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - констрейты лого
    private enum LogoContrate {
        static let logoWidht: CGFloat = 104 //установили статичную ширину для лого
        static let logoHeight: CGFloat = 40 // утстановили статичную высоту для лого
    }
    
    //MARK: - создали изображение
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "Instagram_logo.svg")
        return view
    }()
}

private extension LogoView {
    func initialize() {
        addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview() //все 4 грани прикованны к границам view
            make.width.equalTo(LogoContrate.logoWidht)
            make.height.equalTo(LogoContrate.logoHeight)
        }
    }
}
