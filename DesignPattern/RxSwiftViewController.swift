//
//  RxSwiftViewController.swift
//  DesignPattern
//
//  Created by t2023-m079 on 12/6/23.
//

import UIKit
import RxSwift
import RxCocoa

class RxSwiftViewController: UIViewController {

    private let rxView = MVVMView()
    private let rxViewModel = RxViewModel()
    private let disposeBag = DisposeBag()
    
    
    override func loadView() {
        view = rxView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setInitialData()
        bind()
    }
    
    private func setInitialData() {
        rxView.nameLabel.text = humanData[0].name
        rxView.ageLabel.text = String(humanData[0].age)
        
    }
    
    private func bind() {
        let input = RxViewModel.Input(
            nextButtonClick: rxView.nextButton.rx.tap,
            previousButtonClick: rxView.previousButton.rx.tap
        )
        let output = rxViewModel.transform(input: input)
        
        output.nameText
            .drive(rxView.nameLabel.rx.text)
            .disposed(by: disposeBag)
        
        output.ageText
            .drive(rxView.ageLabel.rx.text)
            .disposed(by: disposeBag)
    }

}
