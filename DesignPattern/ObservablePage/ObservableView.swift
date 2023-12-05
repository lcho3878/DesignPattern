//
//  MainView.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/5/23.
//

import UIKit
import Then
import SnapKit

class ObservableView: UIView {
    
    let nameLabel = UILabel().then {
        $0.text = "Name Label"
        $0.textColor = .blue
    }
    let ageLabel = UILabel().then {
        $0.text = "Age Label"
        $0.textColor = .blue
    }
    
    let nextButton = UIButton().then {
        $0.setTitle("Next", for: .normal)
        $0.backgroundColor = .systemPink
    }
    let previousButton = UIButton().then {
        $0.setTitle("previous", for: .normal)
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
    
    private func setupUI() {
        backgroundColor = .systemBackground
        addSubview(nameLabel)
        addSubview(ageLabel)
        addSubview(previousButton)
        addSubview(nextButton)
    }
    
    private func setupConstraint() {
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(safeAreaLayoutGuide).offset(50)
        }
        
        ageLabel.snp.makeConstraints {
            $0.centerX.equalTo(nameLabel)
            $0.top.equalTo(nameLabel.snp.bottom).offset(10)
        }
        
        previousButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(ageLabel.snp.bottom).offset(50)
        }
        nextButton.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(previousButton.snp.bottom).offset(20)
        }
    }

}
