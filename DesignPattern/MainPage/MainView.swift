//
//  MainView.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    
    let observableButton = UIButton().then {
        $0.setTitle("Observable", for: .normal)
        $0.backgroundColor = .systemPink
    }
    
    let combineButton = UIButton().then {
        $0.setTitle("Combine", for: .normal)
        $0.backgroundColor = .systemPink
    }
    
    let rxSwiftButton = UIButton().then {
        $0.setTitle("RxSwift", for: .normal)
        $0.backgroundColor = .systemPink
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        setupConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setupUI () {
        backgroundColor = .systemBackground
        addSubview(observableButton)
        addSubview(combineButton)
        addSubview(rxSwiftButton)
    }
    
    private func setupConstraint() {
        observableButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        combineButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(observableButton.snp.bottom).offset(20)
        }
        rxSwiftButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(combineButton.snp.bottom).offset(20)
        }
    }

}
