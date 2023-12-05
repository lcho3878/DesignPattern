//
//  MainView.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit
import Then
import SnapKit

class MainView: UIView {
    
    private let mainLabel = UILabel().then {
        $0.text = "Main Label"
        $0.textColor = .blue
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(mainLabel)
    }
    
    private func setupConstraint() {
        mainLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }

}
