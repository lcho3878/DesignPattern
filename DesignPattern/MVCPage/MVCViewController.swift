//
//  MVCViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/12/23.
//

import UIKit

class MVCViewController: UIViewController {
    
    private var index: Int = 0

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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupConstraint()
        setAddTarget()
        updateView()
    }
    
    private func setupUI() {
        view.backgroundColor = .systemBackground
        view.addSubview(nameLabel)
        view.addSubview(ageLabel)
        view.addSubview(previousButton)
        view.addSubview(nextButton)
    }
    
    private func setupConstraint() {
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
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
    
    private func updateView() {
        nameLabel.text = humanData[index].name
        ageLabel.text = String(humanData[index].age)
    }
    
    private func setAddTarget() {
        nextButton.addTarget(self, action: #selector(clickNextButton), for: .touchUpInside)
        previousButton.addTarget(self, action: #selector(clickPreviousButton), for: .touchUpInside)
    }
    
    @objc func clickNextButton(_ sender: UIButton) {
        index = index + 1 < humanData.count ? index + 1 : 0
        updateView()
    }
    
    @objc func clickPreviousButton(_ sender: UIButton) {
        index = index - 1 >= 0 ? index - 1 : humanData.count - 1
        updateView()
    }

}
